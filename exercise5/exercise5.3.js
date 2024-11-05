const { runQuery } = require('./database');

const express = require('express');
const port = 3000;
const app = express();

const getUserFare = async (uid) => {
    const sql = 'SELECT users.name, SUM(Round(trains.distance/1000*types.fare_rate, -2)) as fare '
                + 'FROM tickets '
                + 'INNER JOIN users ON tickets.user = users.id '
                + 'INNER JOIN trains ON tickets.train = trains.id '
                + 'INNER JOIN types ON trains.type = types.id '
                + 'WHERE users.id = ?;';
    const result = await runQuery(sql, [uid]);
    return result[0];
};

const getTrainStatus = async (tid) => {
    const sql = 'SELECT trains.id, COUNT(tickets.id) as occupied, types.max_seats as maximum '
                + 'FROM tickets '
                + 'INNER JOIN trains ON tickets.train = trains.id '
                + 'INNER JOIN types ON trains.type = types.id '
                + 'WHERE trains.id = ?;'
    const result = await runQuery(sql, [tid]);
    return result[0];
};


app.get('/fare', async (req, res) => {
    const { uid } = req.query;
    try {
        const {name, fare} = await getUserFare(uid);
        if (name) {
            res.send(`Total fare of ${name} is ${fare} KRW`)
        }
        else {
            res.status(404).send("User not found");
        }
    }
    catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
    
});

app.get('/train/status', async (req, res) => {
    const { tid } = req.query;
    try {
        const { id, occupied, maximum } = await getTrainStatus(tid);
        if (id) {
            if (occupied < maximum) {
                res.send(`Train ${id} is not sold out`);
            }
            else {
                res.send(`Train ${id} is sold out`)
            }
        }
        else {
            res.status(404).send("Train not found");
        }
    }
    catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
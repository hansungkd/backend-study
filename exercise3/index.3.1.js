const express = require('express');
const port = 3000;
const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json()); // Add this to parse JSON body


app.get('/', (req, res) => {
    const query = req.query;
    const response = Object.keys(query).map(k => `${k}: ${query[k]}`).join('\n');
    res.set('Content-Type', 'text/plain');
    res.send(response);
});
app.post('/', (req, res) => {
    const body = req.body;
    const response = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
    res.set('Content-Type', 'text/plain');
    res.send(response);
});
app.put('/', (req, res) => {
    const body = req.body;
    const response = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
    res.set('Content-Type', 'text/plain');
    res.send(response);
});
app.delete('/', (req, res) => {
    const body = req.body;
    const response = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
    res.set('Content-Type', 'text/plain');
    res.send(response);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
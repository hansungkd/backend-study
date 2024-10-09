const express = require('express');
const port = 3000;
const app = express();

const factorial = (n) => {
    if (n == 0) {
        return 1;
    }
    return factorial(n - 1) * n;
}


app.get('/factorial', (req, res) => {
    const { number } = req.query;
    res.redirect(`/factorial/${number}`)
});

app.get('/factorial/:number', (req, res) => {
    res.send(`${factorial(req.params.number)}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
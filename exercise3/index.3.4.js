const express = require('express');
const port = 3000;
const app = express();

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.render('index.pug'));
app.post('/login', (req, res) => {
    const {username, password} = req.body;
    res.set('Content-Type', 'text/plain');
    res.send(`username: ${username}\npassword: ${password}`)
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));
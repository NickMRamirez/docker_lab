var express = require('express');
var app = express();

app.get('/', (req, res) => {
    res.send("Hello!");
    console.log(req.method + " " + req.url + " " + req.header("user-agent"));
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));
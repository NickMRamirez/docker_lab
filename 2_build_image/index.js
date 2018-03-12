var express = require('express');
var app = express();

// Test using environment variable
var message = process.env.message;
if (!message) {
  message = "Hello world!";
}

app.get('/', (req, res) => {
    res.send(message);
    console.log(req.method + " " + req.url + " " + req.header("user-agent"));
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));
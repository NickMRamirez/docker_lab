var express = require('express');
var app = express();

var redis = require('redis');

// Get environment variables
var redisUrl = process.env.redis_url;

app.get('/', (req, res) => {
  res.send('Send message to /save/{msg}')
});

app.post('/save/:message', (req, res) => {
  // save to Redis
  var redisClient = redis.createClient({ host: redisUrl });
  console.log(`Connected to Redis at ${redisUrl}`);

  var message = req.params["message"];
  console.log(`Saving message: ${message}`)

  redisClient.set('message', message);
  res.send("Saved message");
});

app.get('/view', (req, res) => {
  var message = "";

  // get value from Redis
  var redisClient = redis.createClient({ host: redisUrl });
  console.log(`Connected to Redis at ${redisUrl}`);

  redisClient.get('message', function(err, reply) {
    message = reply;
    console.log(`Retrieved message: ${message}`);

    res.send("Message: " + message);
  });
});

app.listen(3000, () => console.log('Example app listening on port 3000!'));

// NOTES:
// docker exec -it myredis redis-cli
// get message
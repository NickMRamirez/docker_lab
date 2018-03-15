# Docker Lab

Lab for learning about Docker

## Hands-on

1. Start a Docker container that uses the `-v` flag to create a volume that serves a node.js app

1. Create a Dockerfile that:
  * Uses the `node:alpine` image
  * Uses `RUN npm install`
  * Uses `CMD ["npm", "start"]`
  * Copies the current directory's files into the image
  * Order the commands to make use of layer caching

1. Use build arguments and labels in the Dockerfile to:
  * Add metadata, such as the version number of the image being built

1. Use environment variables to:
  * Inject an environment variable into the container at runtime
  * Change the environment variable with `docker run` to change the text displayed on the webpage

1. Use a .dockerignore file to:
  * Prevent files such as the Dockerfile from being copied into the image

1. Create a Docker network named "mynet"

1. Create a Redis container and the node.js app and use `--network` to put them both on the "mynet" network

1. Put the name of the Redis server into the node.js container by using the `-e` flag to pass in an environment variable


# Docker Lab

Lab for learning about Docker

# Pre-reqs

* Docker for Windows: https://store.docker.com/editions/community/docker-ce-desktop-windows
* A text editor such as Visual Studio Code: https://code.visualstudio.com/
* Postman (for sending POST requests to the app): https://www.getpostman.com/apps

To speed up the class, please download the Docker images we'll be using ahead of time by using these commands:

```
docker pull node:alpine
docker pull redis
docker pull microsoft/aspnetcore-build:latest
docker pull microsoft/aspnetcore:latest
```

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


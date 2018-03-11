# Docker Lab

Lab for learning about Docker

## Hands-on

1. Create a Dockerfile that:
  * Uses the `node:alpine` image
  * Uses `RUN npm install`
  * Uses `CMD ["npm", "start"]`
  * Copies the current directorie's files into the image
  * Order the commands to make use of layer caching

2. Use build arguments and labels in the Dockerfile to:
  * Add metadata, such as the version number of the image being built

3. Use environment variables to:
  * Inject an environment variable into the container at runtime
  * Change the environment variable with `docker run` to change the text displayed on the webpage

4. Use a .dockerignore file to:
  * Prevent files such as the Dockerfile from being copied into the image

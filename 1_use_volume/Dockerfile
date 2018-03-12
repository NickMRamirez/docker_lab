FROM node:alpine
WORKDIR /home/node/app
EXPOSE 3000
# NOTE: We cannot use RUN npm install here because that is a build-time 
# command, and the files aren't available until runtime.
CMD ["npm", "start"]
FROM node:alpine
WORKDIR /home/node/app
EXPOSE 3000
CMD ["npm", "start"]

ARG name
LABEL name $name

ARG version_num
LABEL version $version_num

ENV message "Hello world!"

COPY . .
RUN npm install

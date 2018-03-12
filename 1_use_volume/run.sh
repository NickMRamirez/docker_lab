#!/bin/bash

docker build -t lab/app1:1.0.0 -t lab/app1:latest .

docker run --rm -it --name myapp -p 3000:3000 -v ${PWD}:/home/node/app lab/app1
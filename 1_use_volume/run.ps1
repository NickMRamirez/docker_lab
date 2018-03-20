npm install

docker build -t lab/app:1.0.0 -t lab/app:latest .

docker run --rm -it --name myapp -p 3000:3000 -v ${PWD}:/home/node/app lab/app
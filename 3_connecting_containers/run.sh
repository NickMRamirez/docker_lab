#!/bin/bash

while getopts ":v:" o; do
    case "${o}" in
        v)
            v=${OPTARG}
            ;;
    esac
done
shift $((OPTIND-1))

if [[ -z $v ]]; then
  echo "-v [version] argument is required"
  exit
fi

version=$v
namespace=lab
image_name=app1

echo Building Docker image $version...

docker build \
  -t $namespace/$image_name:$version \
  -t $namespace/$image_name:latest \
  --build-arg version_num=$version \
  --build-arg name=$image_name . > /dev/null

docker image prune -f --filter label=name=$image_name > /dev/null

if [[ $(docker network ls | grep "mynet") = "" ]]; then
  docker network create mynet
fi

# Note that we are NOT exposing a port (6379) on Redis outside of the container network
docker run --rm -d --name myredis --network mynet redis
docker run --rm -d --name myapp -p 3000:3000 --network mynet -e "redis_url=myredis" $namespace/$image_name

echo
echo Command: docker exec -it myredis redis-cli
echo
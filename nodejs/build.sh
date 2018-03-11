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

echo
echo Image created
echo "--> $namespace/$image_name:$version" 
echo "--> $namespace/$image_name:latest"
echo
echo Usage:
echo docker run --rm -d --name myapp -p 3000:3000 $namespace/$image_name
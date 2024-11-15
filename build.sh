#!/bin/bash -e


pname="${ImageName:-$(basename $(pwd))}"
docker build --build-arg PNAME=${pname} -t ${pname}:base -f docker/Dockerfile.base .

if [ $1 = "base" ]; then
	exit 0
fi

dockerfile="docker/Dockerfile.${1}"
tagname="${pname}:${1}"

if [ -f "${dockerfile}" ]; then
	docker build --build-arg PNAME=${pname} -t ${tagname} -f ${dockerfile} .
else
	echo "Usage: $0 <base|dev|deploy>"
	exit 1
fi

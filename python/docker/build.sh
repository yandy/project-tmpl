#!/bin/bash -e

pname="$(basename $(pwd))"
docker build --build-arg PNAME=${pname} -t ${pname}:base -f docker/Dockerfile.base .

case $1 in
	"dev")
		docker build --build-arg PNAME=${pname} -t ${pname}:dev -f docker/Dockerfile.dev .
		;;
	"deploy")
		docker build --build-arg PNAME=${pname} -t ${pname}:deploy -f docker/Dockerfile.deploy .
		;;
	*)
		echo "Usage: $0 <dev|deploy>"
		;;
esac

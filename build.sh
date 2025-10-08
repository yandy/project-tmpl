#!/bin/bash -e

# 检查参数数量
if [ "$#" -lt 1 ]; then
	echo "Usage: $0 <base|deploy|...>"
	exit 1
fi

pname="${ImageName:-$(basename $(pwd))}"
docker build --build-arg PNAME=${pname} -t ${pname}:base -f docker/Dockerfile.base .

if [ $1 = "base" ]; then
	exit 0
fi

mode="${1:-deploy}"
dockerfile="docker/Dockerfile.${mode}"
tagname="${pname}:${mode}"

if [ -f "${dockerfile}" ]; then
	docker build --build-arg PNAME=${pname} -t ${tagname} -f ${dockerfile} .
else
	echo "Usage: $0 <base|deploy|...>"
	exit 1
fi

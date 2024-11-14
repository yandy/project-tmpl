# Template for Python project

## prepare project

place source code under `project` subdirectory. for example:

```sh
cp -r test-project project
```

## build docker images

```sh
pname=python-tmpl
docker build --build-arg PNAME=${pname} -t ${pname}:base -f docker/Dockerfile.base .
docker build --build-arg PNAME=${pname} -t ${pname}:dev -f docker/Dockerfile.dev .
docker build --build-arg PNAME=${pname} -t ${pname}:deploy -f docker/Dockerfile.deploy .
```

## dev

copy `.devcontainer` to `project`, then open `project` with vscode

```sh
cp -r .devcontainer project
code project
```

## run

```sh
docker run --rm -it -p 8080:5000 ${pname}:deploy flask run --host=0.0.0.0
```

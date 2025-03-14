# Project Templates

## Usage

1. Clone this repo
2. Run `./apply-tmpl.sh <tmpl to use> <target repo to apply to>` from the root of the repo
3. cd to the target repo
4. [optional] if use devcontainer, build docker image for dev first `./docker/build.sh dev`
5. open the target repo in vscode
6. [optional] build docker image for other like `test`, `deploy`, etc., eg. `./docker/build.sh deploy`

## Notes
- The `apply-tmpl.sh` script will overwrite any files in the target repo that are in the template
- Use `.ps1` instead of `.sh` for Windows
- docker build use dirname of repo as image name in default, you can override it by setting `ImageName` env variable, eg. `ImageName=my-image-name ./docker/build.sh dev`

## Templates

1. `cpp` - cpp app template, include dev, deploy
2. `maven` - java app using maven template, include dev, deploy
3. `next` - nextjs app template, include dev, deploy(ssr or static)
4. `python` - python app template, include dev, deploy
5. `rails` - rails app template, include dev, deploy
6. `rust` - rust app template, include dev, deploy

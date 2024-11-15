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

## Templates

1. `python` - python app template, include dev, deploy

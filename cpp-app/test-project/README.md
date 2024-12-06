# cpp docker env template

## dev

use vscode dev container extention

open in vscode, invoke 'rebuild and reopen in container'

open integrated terminal and run commands (eg. `vcpkg install`)


## deploy

```
docker build -t image:tag .
docker run image:tag
```

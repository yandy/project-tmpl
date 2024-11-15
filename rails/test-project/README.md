# nextjs docker env template

## dev

use vscode dev container extention

open in vscode, invoke 'rebuild and reopen in container'

open integrated terminal and run commands (eg. `rails s`)

## deploy

```sh
docker build -t image:tag .
docker run -p 8080:3000 image:tag

# visit
curl -i http://<container_ip>:3000
curl -i http://localhost:8080
```

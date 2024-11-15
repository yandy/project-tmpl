param(
    [Parameter(Mandatory = $true)]
    [string]$mode
)

$pname = (Get-Item -Path ".\").Name
docker build --build-arg PNAME=$pname -t $pname:base -f docker/Dockerfile.base .

switch ($mode) {
    "dev" {
        docker build --build-arg PNAME=$pname -t $pname:dev -f docker/Dockerfile.dev .
        break
    }
    "deploy" {
        docker build --build-arg PNAME=$pname -t $pname:deploy -f docker/Dockerfile.deploy .
        break
    }
    default {
        Write-Host "Usage: $($MyInvocation.MyCommand.Name) <dev|deploy>"
        exit 1
    }
}

param (
    [Parameter(Mandatory = $false)]
    [ValidateSet("dev", "deploy")]
    [string]$mode = "dev"
)

$projectName = (Get-Item (Get-Location)).BaseName

Write-Host "Building base image..."
docker build --build-arg "PNAME=$projectName" -t "$projectName`:base" -f "docker/Dockerfile.base" .

switch ($mode) {
    "dev" {
        Write-Host "Building dev image..."
        docker build --build-arg "PNAME=$projectName" -t "$projectName`:dev" -f "docker/Dockerfile.dev" .
    }
    "deploy" {
        Write-Host "Building deploy image..."
        docker build --build-arg "PNAME=$projectName" -t "$projectName`:deploy" -f "docker/Dockerfile.deploy" .
    }
    default {
        Write-Host "Invalid mode. Please specify either 'dev' or 'deploy'."
    }
}

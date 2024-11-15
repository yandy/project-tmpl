param (
    [Parameter(Mandatory = $true)]
    [string]$mode = "dev"
)

$pname = if ($null -ne $env:ImageName) { $env:ImageName } else { (Get-Item (Get-Location)).BaseName}

Write-Host "Building base image..."
docker build --build-arg "PNAME=$pname" -t "$pname`:base" -f "docker/Dockerfile.base" .

if ($mode -eq "base") {
    exit 0
}

$dockerfile = "docker/Dockerfile.$mode"
$tagname = "$pname`:$mode"

if (Test-Path -Path $dockerfile -PathType Leaf) {
    docker build --build-arg PNAME=$pname -t $tagname -f $dockerfile .
} else {
    Write-Host "Usage: build <base|dev|deploy|...>"
    exit 1
}

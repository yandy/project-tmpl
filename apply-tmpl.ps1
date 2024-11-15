param(
    [Parameter(Mandatory = $true)]
    [string]$tmpl,
    [Parameter(Mandatory = $true)]
    [string]$target
)

if (-not (Test-Path -Path $tmpl -PathType Container)) {
    Write-Host "Template not found: $tmpl"
    exit 1
}

if (-not (Test-Path -Path $target -PathType Container)) {
    New-Item -ItemType Directory -Path $target | Out-Null
}

Copy-Item -Path "$tmpl\*" -Destination $target -Recurse

Write-Host "Template applied to $target successfully."

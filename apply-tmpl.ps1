param(
    [Parameter(Mandatory = $true)]
    [string]$tmpl,
    [Parameter(Mandatory = $true)]
    [string]$target
)

# 检查模板文件是否存在
if (!(Test-Path -Path $tmpl -PathType Container)) {
    Write-Host "Template not found: $tmpl"
    exit 1
}

# 检查目标目录是否存在
if (!(Test-Path -Path $target -PathType Container)) {
    Write-Host "Target directory does not exists: $target"
    exit 1
}

# 应用模板
Copy-Item -Path "$tmpl/docker" -Destination $target -Recurse -Force
Copy-Item -Path "$tmpl/.dockerignore" -Destination $target -Force
Copy-Item -Path "./build.ps1" -Destination "$target/docker" -Force
Copy-Item -Path "./build.sh" -Destination "$target/docker" -Force
if (Test-Path -Path "$tmpl/.extra") {
    Get-Content "$tmpl/.extra" | ForEach-Object {
        $file = $_
        Copy-Item -Path "$tmpl/$file" -Destination "$target" -Recurse -Force
    }
}
if (Test-Path -Path "$tmpl/.notice" -PathType Leaf) {
    Get-Content "$tmpl/.notice"
}

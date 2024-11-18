#!/bin/bash -e

# 检查参数数量
if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <tmpl> <target> [skip_devc]"
	exit 1
fi

# 提取模板和目标路径
tmpl="./$1"
target="$2"
skip_devc=$3

# 检查模板文件是否存在
if [ ! -d "$tmpl" ]; then
	echo "Template not found: $tmpl"
	exit 1
fi

# 检查目标路径是否存在
if [ ! -d "$target" ]; then
	echo "Target does not exists: $target"
	exit 1
fi

# 应用模板
cp -R -t "$target" "$tmpl/docker" "$tmpl/.dockerignore"
cp -t "$target/docker" "./build.sh" "./build.ps1"
if [ -z "$skip_devc" ]; then
	cp -R "$tmpl"/.devcontainer "$target"
fi
if [ -f "$tmpl"/.notice ]; then
	cat "$tmpl"/.notice
fi

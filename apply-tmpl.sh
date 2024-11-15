#!/bin/bash -e

# 检查参数数量
if [ "$#" -lt 2 ]; then
	echo "Usage: $0 <tmpl> <target>"
	exit 1
fi

# 提取模板和目标路径
tmpl="$(dirname $0)/$1"
target="$2"

# 检查模板文件是否存在
if [ ! -d "$tmpl" ]; then
	echo "Template not found: $tmpl"
	exit 1
fi

# 应用模板
cp -R -t "$target" "$tmpl/docker" "$tmpl/.dockerignore"
if [ -d "$tmpl"/.devcontainer ]; then
	cp -R "$tmpl"/.devcontainer "$target"
fi

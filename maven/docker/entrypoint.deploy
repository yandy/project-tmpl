#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.jar`
if [ "${1#-}" != "$1" ] || [ "${1%.jar}" != "$1" ]; then
	set -- java -jar "$@"
fi

exec "$@"

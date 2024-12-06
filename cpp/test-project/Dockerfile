FROM alpine:3 AS base

RUN --mount=type=cache,target=/var/cache/apk/ set -eux; \
    sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories; \
    apk add curl git g++ gcc make zip unzip tar cmake ninja pkgconf

ENV VCPKG_FORCE_SYSTEM_BINARIES=1


# build stage
FROM base AS build

ENV VCPKG_ROOT=/opt/vcpkg

ENV PATH="${PATH}:${VCPKG_ROOT}"

COPY --chmod=755 docker/vcpkg-install /tmp

RUN /tmp/vcpkg-install

COPY . /app

WORKDIR /app

RUN --mount=type=cache,target=/app/vcpkg_installed \
    --mount=type=cache,target=/root/.cache/vcpkg \
    set -eux; \
    vcpkg install; \
    cmake --preset=docker; \
    cmake --build --preset=docker


# deploy stage
FROM alpine:3

RUN --mount=type=cache,target=/var/cache/apk/ set -eux; \
    sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories; \
    apk add libstdc++

COPY --from=build /opt/app /opt/app

ENV PATH="${PATH}:/opt/app/bin"

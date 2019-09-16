FROM ubuntu:19.04

WORKDIR /root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    meson \
    git \
    build-essential \
    ca-certificates \
    software-properties-common \
    wget \
    gpg-agent \
    mingw-w64

RUN add-apt-repository -y ppa:graphics-drivers/ppa \
    && apt-get install -y --no-install-recommends \
        glslang-dev \
        glslang-tools

RUN echo 1 | update-alternatives --config x86_64-w64-mingw32-gcc \
    && echo 1 | update-alternatives --config x86_64-w64-mingw32-g++ \
    && echo 1 | update-alternatives --config i686-w64-mingw32-gcc \
    && echo 1 | update-alternatives --config i686-w64-mingw32-g++

COPY pipeline.patch ./pipeline.patch
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]

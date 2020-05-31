FROM ubuntu:groovy
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /sandbox
WORKDIR /sandbox

RUN apt update && apt install \
        -o Dpkg::Options::="--force-confdef" \
        -o Dpkg::Options::="--force-confold" \
        -y \
        build-essential \
        devscripts \
        debhelper \
        make \
        meson

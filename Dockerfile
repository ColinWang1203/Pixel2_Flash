FROM ubuntu:16.04

LABEL maintainer="lykaios1203@gmail.com"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core gnupg flex bison gperf build-essential \
        zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
        lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libssl-dev \
        libgl1-mesa-dev libxml2-utils xsltproc unzip python openssl lunzip rsync vim bc kmod


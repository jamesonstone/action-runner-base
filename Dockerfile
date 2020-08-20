FROM ubuntu:latest

RUN echo 'root:root' | chpasswd

RUN useradd gha -p gha

RUN apt-get update && apt-get install -y \
    golang \
    git \
    docker


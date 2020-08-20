FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo 'root:root' | chpasswd

RUN useradd gha -p gha

RUN apt-get update && apt-get install -yq \
    golang \
    git-all \
    apt-get clean 

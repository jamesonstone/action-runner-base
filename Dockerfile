FROM ubuntu:latest

WORKDIR /action/actions-runner

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo 'root:root' | chpasswd
RUN useradd gha -p gha

RUN apt-get update && apt-get install -yq \
    curl \
    golang \
    git-all \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN apt-key fingerprint 0EBFCD88

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN curl -LO https://github.com/actions/runner/releases/download/v2.272.0/actions-runner-linux-x64-2.272.0.tar.gz  &&\
    tar xzf ./actions-runner-linux-x64-2.272.0.tar.gz && \
    rm -f actions-runner-linux-x64-2.272.0.tar.gz && \
    ./bin/installdependencies.sh

FROM jenkins/jenkins:latest
USER root

RUN apt-get update \
    && apt-get upgrade -y \
    && apt install -y \
    sudo \
    docker \
    libltdl-dev \
    python3-pip \
    python3-setuptools \
    python-wheel \
    python-wheel-common \
    zip \
    unzip \
    golang \
    && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN pip3 install docker-compose --system --upgrade

USER jenkins
WORKDIR /var/jenkins_home

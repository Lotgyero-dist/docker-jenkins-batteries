FROM jenkins/jenkins:jkd11

USER root

RUN apt-get update \
    && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    golang \
    libltdl-dev \
    python-wheel \
    python-wheel-common \
    python3-pip \
    python3-setuptools \
    software-properties-common \
    sudo \
    unzip \
    zip \
    && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && \
    apt-get update \
    && \
    apt-get install -y docker-ce-cli  \
    && \
    rm -rf /var/lib/apt/lists/* \
    && \
    echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && \
    pip3 install docker-compose --system --upgrade

USER jenkins

WORKDIR /var/jenkins_home

FROM jenkins/jenkins:jdk11

USER root

RUN apt-get update \
    && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    golang \
    libltdl-dev \
    software-properties-common \
    sudo \
    unzip \
    zip \
    python-wheel-common \
    python3-pip \
    python3-setuptools \
    && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg  \
    && \
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
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

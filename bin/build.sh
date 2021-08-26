#!/usr/bin/env bash

bldgrn=`tput setaf 2; tput bold`
bldylw=`tput setaf 3; tput bold`
txtrst=`tput sgr0`

WORK_PATH="`dirname \"${0}\"`"
WORK_PATH="`( cd \"${WORK_PATH}/../\" && pwd )`"

docker image build --pull --file "${WORK_PATH}/jdk11.Dockerfile" --tag lotygerodistribution/jenkins-batteries:jdk11 "${WORK_PATH}/."

exit 0;

FROM bellsoft/liberica-openjdk-alpine:17.0.8

#install curl and jq
RUN apk add curl jq

#workspace
WORKDIR /home/my-selenium-docker

#add the req files to run the test
ADD target/docker-resources         ./
ADD runner.sh                       runner.sh

#start the runner sh
ENTRYPOINT sh runner.sh

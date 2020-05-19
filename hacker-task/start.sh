#!/bin/bash
app="docker.test"
sudo docker build -t ${app} .
docker run -d -p 3333:80 \
  --name=${app} \
  -v $PWD:/app ${app}

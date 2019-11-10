#!/usr/bin/env bash

#Build docker image
docker build -f build/Dockerfile . --tag=myhelloworld

#Run docker container
docker run myhelloworld:latest


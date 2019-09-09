#!/bin/bash

DOCKERFILE="docker/fedora-texlive-scheme-full/Dockerfile"
if [ ! -f $DOCKERFILE ] ; then
	echo "$DOCKERFILE not found"
	exit 1
fi

docker build -t fedora-texlive-scheme-full . -f docker/fedora-texlive-scheme-full/Dockerfile
docker build -t mcec-cv . -f docker/mcec-cv/Dockerfile

AB=$(realpath $(pwd))
docker run --rm=true -u $(id -u):$(id -g) -i \
  -v ${AB}:${HOME} \
  -w ${HOME} -it  mcec-cv $@

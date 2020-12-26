#!/usr/bin/env bash

if [ "$1" == "--build" ]; then
    docker build --tag hello_nim .
else
    docker run --rm -it -v $(pwd):/hello hello_nim
fi

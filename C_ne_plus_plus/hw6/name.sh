#!/bin/sh

printf "Enter your name: "
read name

if [ -z "$name" ]; then
    name=$(whoami)
    echo "Hello, $name?"
else
    echo "Hello, $name!"
fi

#!/bin/sh

set -ex

for file in Dockerfile.*; do
    image_name="$(echo "$file" | awk -F'.' '{print $2"-builder:"$3}')"
    docker build -t $image_name -f $file .
done

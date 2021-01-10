#!/bin/sh -eu

namespace='docker.io/roryrjb'
push=

usage()
{
cat <<EOF | cat
Usage: ${0##*/} [-hp]

Options:
  -h    show options
  -p    push to Docker Hub after building
EOF
}

while getopts 'hp' opt; do
    case $opt in
        p) push=1; ;;
        h) usage; exit 0 ;;
        *) exit 1 ;;
    esac
done

for file in Dockerfile.*
do
    image_name="$(echo "$file" | awk -F'.' '{print $2"-builder:"$3}')"
    docker build -t "${namespace}/${image_name}" -f "$file" .

    if [ "$push" ]
    then
        docker push "${namespace}/${image_name}"
    fi
done

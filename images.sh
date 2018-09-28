#!/usr/bin/env bash

set -e

echo "Building Docker containers"

declare -a IMAGES
DIRS=( $(basename $(echo */)) )

REGISTRY='safetyculture'
BASE_IMAGE='protoc'
BASE_TAG=`cat version.txt`

buildAll () {
  echo
  echo "Building $BASE_IMAGE:$BASE_TAG ... "
  # docker build -t $REGISTRY/$BASE_IMAGE:$BASE_TAG .
  IMAGES+=( $REGISTRY/$BASE_IMAGE:$BASE_TAG )
  for i in ${!DIRS[@]};
  do
    TAG=`cat ${DIRS[$i]}/version.txt`
    echo
    echo "Building ${DIRS[$i]}:$TAG ... "
    IMAGE=$REGISTRY/$BASE_IMAGE-${DIRS[$i]}:$TAG
    # docker build -t $IMAGE ./${DIRS[$i]}
    IMAGES+=( $IMAGE )
  done
}

# while [[ $# > 1 ]]
# do
#   key="$1"

#   case $key in
#     -t|--tag)
#       TAG=$2
#       shift
#       ;;
#     *)
#       ;;
#   esac
#   shift
# done

buildAll

echo "Done!"

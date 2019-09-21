#!/usr/bin/env bash

set -ev

SCRIPT_DIR=$(dirname "$0")

mvn -DskipTests package

if [[ -z "$TAG" ]] ; then
    TAG=latest
fi

GROUP=localhost:5000 TRAVIS_TAG=v2  COMMIT=test ./scripts/build.sh
GROUP=localhost:5000 TRAVIS_TAG=v2  COMMIT=test ./scripts/push.sh
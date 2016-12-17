#!/usr/bin/env bash

PROJECT_HOME=$( cd $(dirname $0)/..; pwd )
ZIPFILE=$PROJECT_HOME/dist/commandoxfit.src.zip

cd $PROJECT_HOME/src
mkdir -p ../dist
[[ -f $ZIPFILE ]] && rm -f $ZIPFILE

if [[ $(ls -A) ]]; then
  zip $ZIPFILE *
else
  echo "Nothing to build"
fi

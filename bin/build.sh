#!/usr/bin/env bash

unset do_deployment

[[ $1 == "-y" ]] && do_deployment="Y"

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

while [[ $do_deployment != "N" && $do_deployment != "Y" ]]; do
  echo -n "Deploy? "
  read do_deployment
  do_deployment=$(echo $do_deployment | awk '{print toupper($0)}')
done

if [[ $do_deployment == "Y" ]]; then
  $PROJECT_HOME/bin/deploy.sh
fi

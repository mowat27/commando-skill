#!/usr/bin/env bash

if [[ -z "$AWS_ACCESS_KEY_ID" || -z "$AWS_SECRET_ACCESS_KEY" ]]; then
  echo "Please export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY" >&2
  exit 1
fi

node-lambda deploy \
  --environment production \
  --region eu-west-1 \
  --functionName "arn:aws:lambda:eu-west-1:525027603511:function:commandoXFitClasses" \
  --role "arn:aws:iam::525027603511:role/service-role/commandoLambda"

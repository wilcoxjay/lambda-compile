#!/bin/sh

if ! [ "$1" ]; then
  echo "You didn't specify which function to test"
  exit 1
fi

func="lilybin-$1"

aws lambda invoke \
  --invocation-type RequestResponse \
  --cli-binary-format raw-in-base64-out \
  --function-name "$func" \
  --log-type Tail \
  --payload file://payload.json \
  output.txt > log.txt

jq -r .LogResult log.txt | base64 -d
jq 'del(.LogResult)' log.txt
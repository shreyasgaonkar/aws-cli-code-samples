#!/bin/bash
set -e

usage="
Usage: $(basename "$0") -x RUNTIME [-r REGION]

Retuns lists of Lambda functions and versions using a runtime set by:

  -x  Set the runtime identifier to select:
    NodeJS: nodejs14.x, nodejs12.x, nodejs10.x
    Python: python3.8, python3.7, python3.6, python2.7
    Ruby: ruby2.7, ruby2.5
    Java: java11, java8.al2. java8
    Go: go1.x
    .NET Core: dotnetcore3.1, dotnetcore2.1
    Custom Runtime: provided.al2, provided
  More info: https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html

  -r  (Optional) Overrides the AWS region. Defaults to current region as per aws configure"


# Get usage report bucket from command line argument
while getopts x:r: opts
do
   case ${opts} in
      x)
        RUNTIME=$OPTARG
        ;;
      \?)
        echo "usage: ./list-functions-by-runtime -x python2.7"
        ;;
      r)
        REGION=$OPTARG
        ;;
      \?)
        echo "usage: ./list-functions-by-x -runtime python2.7 -r us-east-1"
        ;;
   esac
done

# Check mandatory runtime argument
if [ ! "$RUNTIME" ]; then
  echo "Error: -x argument must be provided to list functions by runtime"
  echo "$usage" >&2; exit 1
fi

# Override the AWS region
if [[ $REGION ]]
then
  aws lambda list-functions --function-version ALL --region $REGION --output table --query 'Functions[?Runtime==`'$RUNTIME'`].[FunctionArn,Runtime]'
else
  aws lambda list-functions --function-version ALL --output table --query 'Functions[?Runtime==`'$RUNTIME'`].[FunctionArn,Runtime]'
fi

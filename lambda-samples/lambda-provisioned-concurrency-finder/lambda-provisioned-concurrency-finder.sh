#! /bin/bash

# Check for optional region flag
while getopts "r:" opt;
do
  case ${opt} in
    r)
      REG=$OPTARG
      ;;
    \?)
      echo "usage: ./lambda-provisioned-concurrency-finder.sh -r <aws-region>"
      ;;
  esac
done


if [[ $REG ]]
then
  OUTPUT=$(aws lambda list-functions --function-version ALL --region $REG --query 'Functions[?Version!=`$LATEST`].[FunctionName]' --output text | sort -u | xargs -L1 aws lambda list-provisioned-concurrency-configs --query 'ProvisionedConcurrencyConfigs' --output table --function-name)
else
  OUTPUT="TRUE" # Setting to a non-zero value for the next check
  aws lambda list-functions --function-version ALL --query 'Functions[?Version!=`$LATEST`].[FunctionName]' --output text | sort -u | xargs -L1 aws lambda list-provisioned-concurrency-configs --query 'ProvisionedConcurrencyConfigs' --output table --function-name
fi


if [[ -z $OUTPUT ]]
then
  echo "Provisioned Concurrency not found in this region"
fi

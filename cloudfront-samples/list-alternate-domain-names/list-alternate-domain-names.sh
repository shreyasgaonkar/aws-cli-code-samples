#! /bin/bash
#! /usr/local/bin/aws

# aws configure set preview.cloudfront true && aws cloudfront list-distributions --query 'DistributionList.Items[*].{CloudFrontID:Id,Status:Status,CustomDomainNames:Aliases.Items,LambdaAtEdgeFunctions: DefaultCacheBehavior.LambdaFunctionAssociations.Items[*].LambdaFunctionARN}'

# Uncomment the next line for shorter output using jq

aws configure set preview.cloudfront true && aws cloudfront list-distributions --query 'DistributionList.Items[*].{CloudFrontID:Id,Status:Status,CustomDomainNames:Aliases.Items,LambdaAtEdgeFunctions: DefaultCacheBehavior.LambdaFunctionAssociations.Items[*].LambdaFunctionARN}' | jq -r '.[] | "CloudFrontID: \(.CloudFrontID) Custom Domains: \(.CustomDomainNames)"'

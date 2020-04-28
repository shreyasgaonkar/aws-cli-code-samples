#! /bin/bash
#! /usr/local/bin/aws


# aws cloudfront list-distributions --no-paginate --query 'DistributionList.Items[*].{DistributionID: Id, DomainName: DomainName, Status: Status, LambdaAtEdge: DefaultCacheBehavior.LambdaFunctionAssociations.Items[*].LambdaFunctionARN}' | grep "aws:lambda" -B 2 -A 3

## Alternatate domain names

# aws configure set preview.cloudfront true && aws cloudfront list-distributions --query 'DistributionList.Items[*].{CloudFrontID:Id,Status:Status,LambdaAtEdgeFunctions: DefaultCacheBehavior.LambdaFunctionAssociations.Items[*].LambdaFunctionARN}'


# Uncomment the next line for shorter output using jq

aws configure set preview.cloudfront true && aws cloudfront list-distributions --query 'DistributionList.Items[*].{CloudFrontID:Id,Status:Status,CustomDomainNames:Aliases.Items,LambdaAtEdgeFunctions: DefaultCacheBehavior.LambdaFunctionAssociations.Items[*].LambdaFunctionARN}' | jq -r '.[] | "CloudFrontID: \(.CloudFrontID) LambdaAtEdgeFunctions: \(.LambdaAtEdgeFunctions)"'

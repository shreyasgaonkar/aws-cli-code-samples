#! /bin/bash
#! /usr/local/bin/aws

REGION='us-west-2'

aws ec2 describe-network-interfaces --region $REGION --query 'NetworkInterfaces[?Status!=`null`] | [?contains(Description, `AWS Lambda VPC ENI`)] | [?contains(Attachment.AttachmentId, `ela-attach`)].{NetworkInterfaceId:NetworkInterfaceId,Status:Status,SecurityGroupID:Groups[*].GroupId,SubnetId:SubnetId,VpcId:VpcId}'

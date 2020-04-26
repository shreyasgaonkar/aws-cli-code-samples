If you are looking to list all the ENIs that Lambda created with the new changes to [Lambda VPC architecture](https://aws.amazon.com/blogs/compute/announcing-improved-vpc-networking-for-aws-lambda-functions/), run [this script](lambda-created-enis.sh) with replacing the REGION variable.

This will parse through all ENIs created in that region against the attachment id, and the description that Lambda sets while creating them. If you come across You are not allowed to manage ```'ela-attach'``` attachments error while trying to manually delete the ENI, this might be useful.


### Sample Output:
```shell
...
{
    "Status": "in-use",
    "SubnetId": "subnet-XXXXXXXX",
    "NetworkInterfaceId": "eni-XXXXXXXXXXXXXXXXX",
    "SecurityGroupID": [
        "sg-XXXXXXXX"
    ],
    "VpcId": "vpc-XXXXXXXX"
},
{
    "Status": "in-use",
    "SubnetId": "subnet-XXXXXXXX",
    "NetworkInterfaceId": "eni-XXXXXXXXXXXXXXXXX",
    "SecurityGroupID": [
        "sg-XXXXXXXX",
        "sg-XXXXXXXX",
        "sg-XXXXXXXX"
    ],
    "VpcId": "vpc-XXXXXXXX"
}
...
```

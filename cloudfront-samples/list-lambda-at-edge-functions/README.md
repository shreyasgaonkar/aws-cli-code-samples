[This script](list-lambda-at-edge-functions.sh) will parse through all the CloudFront distributions in the account and output the associated Lambda@Edge functions associated with the distribution.

#### Output:
```json
[
    ...
    {
        "CloudFrontID": "XXXXXXXXXXXXXX",
        "Status": "Deployed",
        "LambdaAtEdgeFunctions": [
            "arn:aws:lambda:us-east-1:XXXXXXXXXXXX:function:lambda_at_edge_200:1",
            "arn:aws:lambda:us-east-1:XXXXXXXXXXXX:function:lambda_at_edge_403:1"
        ]
    },
    {
        "CloudFrontID": "XXXXXXXXXXXXXX",
        "Status": "Deployed",
        "LambdaAtEdgeFunctions": null
    }
    ...
]
```

#### Optional Output:
```json
...
CloudFrontID: XXXXXXXXXXXXXX LambdaAtEdgeFunctions: ["arn:aws:lambda:us-east-1:XXXXXXXXXXXX:function:lambda_at_edge_200:1","arn:aws:lambda:us-east-1:XXXXXXXXXXXX:function:lambda_at_edge_403:1"]
CloudFrontID: XXXXXXXXXXXXXX LambdaAtEdgeFunctions: null
...
```

[This script](list-alternate-domain-names.sh) will parse through all the CloudFront distributions in the account and output the associated custom domain names on it. This is easier when you have multiple alternate domain names which console doesn't list them all.

If you run into errors such as
```
- Status Code: 409; Error Code: CNAMEAlreadyExists; Request ID:a123456b-c78d-90e1-23f4-gh5i67890jkl
- This domain name is already associated with another CloudFront distribution
```
while reusing a custom domain name, this may help narrow down the search.

#### Output:
```json
[
    ...
    {
        "CloudFrontID": "XXXXXXXXXXXXXX",
        "Status": "Deployed",
        "CustomDomainNames": [
            "example.com",
            "www.example.com"
        ]
    },
    {
        "CloudFrontID": "XXXXXXXXXXXXXX",
        "Status": "Deployed",
        "CustomDomainNames": null
    }
    ...
]
```

#### Optional Output:
```json
...
CloudFrontID: XXXXXXXXXXXXXX Custom Domains: ["example.com","www.example.com"]
CloudFrontID: XXXXXXXXXXXXXX Custom Domains: null
...
```

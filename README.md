# AWS CLI code samples

A few examples of using AWS CLI for common use-cases dealing with few AWS services.

## Lambda

1. Hyperplane ENIs created by Lambda - [lambda-created-enis.sh](lambda-samples/lambda-created-enis)

<!-- 2. Lambda function(s) using an ENI - [lambda-using-an-eni.sh](lambda-samples/lambda-using-an-eni) -->

2. Lambda Provisioned Concurrency finder - [lambda-provisioned-concurrency-finder.sh](lambda-samples/lambda-provisioned-concurrency-finder)

## SNS

1. Get SMS month to date spend in USD - [sms_dashboard.sh](sns-samples/sms_dashboard/)

## Additional Information

- Refer to the individual .md files for additional information.

## Built with
- [AWS CLI](https://aws.amazon.com/cli/)

## Missing Info / Bugs

- :cold_sweat: Something broken? [Open an issue](https://github.com/shreyasgaonkar/aws-cli-code-samples//issues) with a few sample inputs where it breaks. Screenshots help!

- More additional services/use-cases, [open a new issue](https://github.com/shreyasgaonkar/aws-cli-code-samples//issues)

## Contributing

This is an iterative repository, I'll keep adding more sample codes for more use-cases as I come across them. I have tested all scripts using ```aws-cli/1.18.46``` or above version.

- Fork repo
- Upgrade AWS CLI: ```$ pip install --upgrade awscli --user```
- Send your awesome :raised_hands: [Pull Request](https://github.com/shreyasgaonkar/aws-cli-code-samples//pulls) with code/.md changes
    - Commit using the [Seven Rules](https://chris.beams.io/posts/git-commit/#seven-rules)
- Your PR gets merged :white_check_mark: and a shoutout :loudspeaker:


#### Repo structure:

```bash
$ tree
.
├── CODE_OF_CONDUCT.md
├── LICENSE
├── README.md
├── lambda-samples
│   ├── lambda-created-enis
│   │   ├── README.md
│   │   └── lambda-created-enis.sh
│   ├── lambda-provisioned-concurrency-finder
│   │   ├── README.md
│   │   └── lambda-provisioned-concurrency-finder.sh
└── sns-samples
    └── sms-dashboard
        ├── README.md
        └── sms-dashboard.sh
```

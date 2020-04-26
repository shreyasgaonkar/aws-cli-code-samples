# AWS CLI code samples

A few examples of using AWS CLI for common use-cases dealing with few AWS services.

## SNS

1. Get SMS month to date spend in USD - [sms_dashboard.py](sns-samples/sms_dashboard/)

## Additional Information

- Refer to the individual .md files for additional information.

## Built with
- [AWS CLI](https://aws.amazon.com/cli/)

## Missing Info / Bugs

- :cold_sweat: Something broken? [Open an issue](https://github.com/shreyasgaonkar/aws-cli-code-samples//issues) with a few sample inputs where it breaks. Screenshots help!

- More additional services/use-cases, [open a new issue](https://github.com/shreyasgaonkar/aws-cli-code-samples//issues)

## Contributing

This is an iterative repository, I'll keep adding more sample codes for more use-cases as I come across them. I have tested all scripts using ```aws-cli/1.16.239``` or above version.

- Fork repo
- Upgrade AWS CLI: ```$ pip install --upgrade awscli --user```
- Send your awesome :raised_hands: [Pull Request](https://github.com/shreyasgaonkar/aws-cli-code-samples//pulls) with code/.md changes
    - Commit using the [Seven Rules](https://chris.beams.io/posts/git-commit/#seven-rules)
- Your PR gets merged :white_check_mark: and a shoutout :loudspeaker:


#### Repo structure:

```bash
$ tree
.
├── README.md
├── lambda-samples
│   └── lambda-created-enis
│       ├── README.md
│       └── lambda-created-enis.sh
└── sns-samples
    └── sms-dashboard
        ├── README.md
        └── sms-dashboard.sh
```

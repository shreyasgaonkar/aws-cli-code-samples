[This script](sms-dashboard.sh) will parse SMS UsageReport S3 bucket to display Total number of messages sent in a month.

This will download and extract all the ```.csv.gz``` files created by SNS under S3 bucket to extract the "TotalParts" - giving us more accurate representation of the number of SMS' sent in a calendar month.

:warning: If your account isn't configured with SNS UsageReport, this will not work for you. Reach out to AWS Support if you need this information.

```
Usage: ./sms-usage-report.sh -b BUCKET_NAME [-r REGION] [-y YEAR] [-m MONTH]

Calls S3 to retrieve and parse the usage report to calculate number of messages sent in a calendar month
where:
    -b  Takes the input SMS usage report S3 bucket name
    -r  (Optional) Overrides region of S3 bucket. Defaults to current region as per aws configure
    -y  (Optional) Year for SMS report in YYYY format. Defaults to current year
    -m  (Optional) Month for SMS report in MM format. Defaults to current month
```


**Usage**:
```bash
./sms-usage-report.sh -b <s3-bucket-name>

Searching for SMS usage report for 04/2021 in us-west-2 region.

Creating new directory under /tmp/SMSUsageReports
Total SMS sent: 10
Deleted: /tmp/SMSUsageReports
```

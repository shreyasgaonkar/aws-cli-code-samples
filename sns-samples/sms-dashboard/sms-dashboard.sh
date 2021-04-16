#!/bin/bash
set -e

usage="
Usage: $(basename "$0") -b BUCKET_NAME [-r REGION] [-y YEAR] [-m MONTH]

Calls S3 to retrieve and parse the usage report to calculate number of messages sent in a calendar month
where:
    -b  Takes the input SMS usage report S3 bucket name
    -r  (Optional) Overrides region of S3 bucket. Defaults to current region as per aws configure
    -y  (Optional) Year for SMS report in YYYY format. Defaults to current year
    -m  (Optional) Month for SMS report in MM format. Defaults to current month"


# Set current month and year
YEAR=$(date +'%Y')
MONTH=$(date +'%m')
REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')

# Get usage report bucket from command line argument
while getopts b:y:m:r: opts
do
   case ${opts} in
      b)
        USAGE_REPORT_BUCKET_NAME=${OPTARG}
        ;;
      \?)
        echo "Please set the UsageReport bucketname in this script using -b flag. Example: ./sms-usage-reports.sh -b my_bucket"
        exit 1
        ;;
      y)
        YEAR=$OPTARG
        ;;
      \?)
        echo "usage: ./sms-usage-reports.sh -b my_bucket -y YYYY"
        ;;
      m)
        MONTH=$OPTARG
        ;;
      \?)
        echo "usage: ./sms-usage-reports.sh -b my_bucket -y MM"
        ;;
      r)
        REGION=$OPTARG
        ;;
      \?)
        echo "usage: ./sms-usage-reports.sh -b my_bucket -r us-east-1"
        ;;
   esac
done

# mandatory arguments
if [ ! "$USAGE_REPORT_BUCKET_NAME" ]; then
  echo "Error: -b argument must be provided to state the SMS usage report bucket name"
  echo "$usage" >&2; exit 1
fi

echo "Searching for SMS usage report for $MONTH/$YEAR in $REGION region."


echo "Creating new directory under /tmp/SMSUsageReports"
mkdir -p /tmp/SMSUsageReports
cd /tmp/SMSUsageReports

$(aws s3 sync --only-show-errors s3://$USAGE_REPORT_BUCKET_NAME/SMSUsageReports/$REGION/$YEAR/$MONTH .) && $(find . -type f 2> /dev/null | xargs gunzip 2> /dev/null)
TOTALSMS=$(find . -type f | cat */*  | awk -F ',' '{count[$8]++} END {for (word in count) print word, count[word]}' | grep -v  TotalParts | awk -F " " '{print $2}')
echo "Total SMS sent: ${TOTALSMS:-0}"


rm -r /tmp/SMSUsageReports && echo "Deleted: /tmp/SMSUsageReports"

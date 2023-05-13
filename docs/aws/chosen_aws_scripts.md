# Chosen handy scripts

Below is a list of scrpts that one can find handy. It is only some of many scripts I wrote. I will try to add more soon.

## S3

### Looking for non-empty bucket in account.

Requires bash, jq, aws cli v2, aws-profile configured.

```bash
#!/bin/bash
# Note requires .jq.

#VERSION=$(aws --version | cut -f2 -d'/')
MAJOR=$(aws --version | cut -f2 -d'/' | cut -f1 -d'.')

if [ $MAJOR -ne 2 ]; then
    echo "only version 2 supported"
    exit
fi

#aws s3api list-buckets | jq .
BUCKETS=$(aws s3api list-buckets | jq .Buckets[].Name -r)
for BUCKET in $BUCKETS; do
    COUNT=$(aws s3api list-objects --bucket ${BUCKET} | jq ".Contents | length")
    if [ "${COUNT}" != "0" ]; then
        echo $BUCKET
    fi
done
```
<script src="https://gist.github.com/wkaczurba/18582b722c1e0daa26200905cdc60f0a.js"></script>

### Deletion of bucket with its contents.

```bash
BUCKET="mybucket"
aws s3 rb s3://${BUCKET} --force
```

### Deletion of all bucket contents:

`aws s3 rm s3://${BUCKET}/ --recursive` - deletes all contents within a bucket




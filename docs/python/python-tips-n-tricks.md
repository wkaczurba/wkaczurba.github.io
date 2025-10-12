# Python Tips n Tricks

## Python Quick HTTP server

To serve local files from folder using the following: `python3 -m http.server 5500`

## Python AWS Boto3 autosuggestions in pycharm

1. Install boto3-stubs:
    ```
    pip install boto3-stubs[essential]
    ```

    or specific ones:

    ```
    pip install boto3-stubs[s3,ec2,labmda,cloudwatch,sqs]
    ```

2. Restart pycharm
3. Check the right interpreter is on and has boto3-stubs installed.
    - checking if package is installed: `pip show boto3-stubs`
4. add type annotation to help pycharm, eg.: `s3client: S3Client = boto3.client("s3")`
5. (If needed): Rebuild indexes (invalidate caches/restart)


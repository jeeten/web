# geting connection to s3
# import resource

import boto3
s3 = boto3.Session(
    aws_access_key_id='',
    aws_secret_access_key='',
)
# s3 = boto3

for obj in s3.resource(service_name='s3').Bucket('terraform-glob-state').objects.all():
    print(obj)

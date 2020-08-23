import json
import boto3

client = boto3.client('ec2')


def lambda_handler(event, context):
    """Sample pure Lambda function

    Parameters
    ----------
    event: dict, required
        API Gateway Lambda Proxy Input Format

        Event doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format

    context: object, required
        Lambda Context runtime methods and attributes

        Context doc: https://docs.aws.amazon.com/lambda/latest/dg/python-context-object.html

    Returns
    ------
    API Gateway Lambda Proxy Output Format: dict

        Return doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html
    """

    #print(event)

    data = {}
    data['status'] = 'value'

    #ToDo: Get Instance ID from somewhere, maybe CF or maybe ASG
    instanceID="i-0eadf8415c843e62a"

    response = client.start_instances(
            InstanceIds=[
                instanceID,
            ]
        )

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": response
        }),
    }

lambda_handler(1,2)
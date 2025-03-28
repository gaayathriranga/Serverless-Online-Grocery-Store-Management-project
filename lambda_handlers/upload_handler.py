import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('mygrocery-product')

def lambda_handler(event, context):
    try:
        body = json.loads(event['body']) 

        required_keys = ["customerName", "productName", "quantity", "price", "total"]
       
        customerName = body['customerName']
        productName = body['productName']
        quantity = int(body['quantity'])
        if quantity <= 0:
            raise ValueError("Quantity must be a positive integer")
        price = int(body['price'])
        if price <= 0:
            raise ValueError("Price must be a positive integer")
        total = int(body['total'])

        table.put_item(
            Item={
                'customerName': customerName,
                'productName': productName,
                'quantity': quantity,
                'price': price,
                'total': total
            }
        )
    except (KeyError, ValueError) as e:
        return {
            'statusCode': 400,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps(str(e))
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps(f"An error occurred: {str(e)}")
        }

    return {
    'statusCode': 200,
    'headers': {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
    },
    'body': json.dumps('Grocery data saved successfully!')
}
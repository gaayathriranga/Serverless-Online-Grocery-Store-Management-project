import unittest
import json  # Import the json module
from unittest.mock import MagicMock
from get_handler import lambda_handler

class TestGetHandler(unittest.TestCase):

    def setUp(self):
        self.event = {}
        self.context = MagicMock()

    def test_lambda_handler(self):
        # Mock DynamoDB resource and table
        mock_table = MagicMock()
        mock_table.scan.return_value = {'Items': [{'customerName': 'TestCustomer', 'productName': 'TestProduct'}]}
        
        # Mock DynamoDB resource and table
        boto3_resource_mock = MagicMock()
        boto3_resource_mock.resource.return_value.Table.return_value = mock_table
        
        # Call lambda_handler with mocked dependencies
        with unittest.mock.patch('get_handler.boto3', boto3_resource_mock):
            response = lambda_handler(self.event, self.context)
        
        # Assertions
        self.assertEqual(response['statusCode'], 200)
        self.assertIn('body', response)
        self.assertIsInstance(response['body'], str)
        data = json.loads(response['body'])  # Ensure json module is used correctly here
        self.assertIsInstance(data, list)
        self.assertGreater(len(data), 0)
        self.assertIn('customerName', data[0])
        self.assertIn('productName', data[0])

if __name__ == '__main__':
    unittest.main()

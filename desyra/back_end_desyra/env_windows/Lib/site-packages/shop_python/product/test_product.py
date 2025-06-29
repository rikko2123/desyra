from .product import Product

import unittest

class TestProduct(unittest.TestCase):
    def setUp(self):
        uniqueId = "test001"
        name = "iPhone 13"
        price = 10.99
        description = "iPhone 13 from Apple Inc"
        quantity = 0

        self.product_iphone = Product(uniqueId, name, price, description, quantity)

    def tearDown(self):
        uniqueId = "test001"
        name = "iPhone 13"
        price = 10.99
        description = "iPhone 13 from Apple Inc"
        quantity = 0

        self.product_iphone = Product(uniqueId, name, price, description, quantity)

    def test_change_product_name(self):
        """
        Test change product name
        """
        expected = "iPhone 14"
        self.product_iphone.change_name(expected)
        self.assertEqual(self.product_iphone.name, expected)

    def test_change_description(self):
        """
        Test change product description
        """
        expected = "Apple's new latest iPhone 14"
        self.product_iphone.change_description(expected)
        self.assertEqual(self.product_iphone.description, expected)

    def test_increase_price(self):
        """
        Test increase price
        """
        expected = 2590.99
        self.product_iphone.increase_price(2580)
        self.assertEqual(self.product_iphone.price, expected)

    def test_decrease_price(self):
        """
        Test decrease price
        """
        expected = 1.99
        self.product_iphone.decrease_price(9)
        self.assertEqual(self.product_iphone.price, expected)

    def test_increase_stock(self):
        """
        Test increase stock
        """
        expected = 100
        self.product_iphone.increase_quantity(100)
        self.assertEqual(self.product_iphone.quantity, expected)

    def test_decrease_stock(self):
        """
        Test decrease stock after increasing stock
        """
        expected = 25
        self.product_iphone.increase_quantity(100)
        self.product_iphone.decrease_quantity(75)
        self.assertEqual(self.product_iphone.quantity, expected)

if __name__ == '__main__':
    unittest.main()

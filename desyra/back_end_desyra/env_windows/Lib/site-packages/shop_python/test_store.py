from .store import Store
from .product.product import Product
from .pos.pos import POS

import unittest

class TestStore(unittest.TestCase):

    def setUp(self):
        name = "Apple Store"
        product1 = Product("ip13", "iPhone 13", 2500.99, "iPhone 13 Midnight Black", 10)
        product2 = Product("ip14", "iPhone 14", 3500.99, "iPhone 14 Scarlet Red", 10)
        current_pos = POS(100)
        self.store = Store(name, [product1, product2], current_pos)
        customer_item1 = Product("ip13", "iPhone 13", 2500.99, "iPhone 13 Midnight Black", 1)
        customer_item2 = Product("ip14", "iPhone 14", 3500.99, "iPhone 14 Scarlet Red", 1)
        self.customer_basket = [customer_item1, customer_item2]


    def tearDown(self):
        name = "Apple Store"
        product1 = Product("ip13", "iPhone 13", 2500.99, "iPhone 13 Midnight Black", 10)
        product2 = Product("ip14", "iPhone 14", 3500.99, "iPhone 14 Scarlet Red", 10)
        current_pos = POS(100)
        self.store = Store(name, [product1, product2], current_pos)
        customer_item1 = Product("ip13", "iPhone 13", 2500.99, "iPhone 13 Midnight Black", 1)
        customer_item2 = Product("ip14", "iPhone 14", 3500.99, "iPhone 14 Scarlet Red", 1)
        self.customer_basket = [customer_item1, customer_item2]


    def test_display_products(self):
        """
        Test Display all products
        """
        self.store.displayProducts()
        expected = ['iPhone 13 $2500.99 - instock: 10', 'iPhone 14 $3500.99 - instock: 10']
        self.assertEqual(self.store.displayProducts(), expected)


    def test_display_product(self):
        """
        Test Display a product
        """
        test = "iPhone 13"
        self.store.displayProduct(test)
        expected = 'iPhone 13 - $2500.99\niPhone 13 Midnight Black\nThere are 10 left'
        self.assertEqual(self.store.displayProduct(test), expected)


    def test_calculate_total_price(self):
        """
        Test calculation for total price
        """
        result = self.store.calculateTotalPrice(self.customer_basket)
        expected = 6001.98
        self.assertEqual(result, expected)

    def test_cash_payment(self):
        """
        Test cash payment
        """
        total_price = 6001.98
        payment_info = {"cash": total_price}
        self.assertTrue(self.store.cash_payment(total_price, self.customer_basket, payment_info))

    def test_card_payment(self):
        """
        Test card payment
        """
        total_price = 6001.98
        payment_info = {
                "card":
                {
                    "number": 12345678901234,
                    "expiry": {
                        "month" : 9,
                        "year" : 29
                    },
                    "cvv": 987
                }
            }
        self.assertTrue(self.store.card_payment(total_price, self.customer_basket, payment_info))

    def test_send_receipt(self):
        """
        Test send receipt
        """
        self.assertTrue(self.store.receipt("yes"))

    def test_dont_send_receipt(self):
        """
        Test no send receipt
        """
        self.assertFalse(self.store.receipt("no"))

if __name__ == "__main__":
    unittest.main()

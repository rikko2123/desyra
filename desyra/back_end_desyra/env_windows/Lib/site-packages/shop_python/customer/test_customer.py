from .customer import Customer
import unittest


class TestCustomer(unittest.TestCase):
    def setUp(self):
        name = "Bob"
        dob = "13/09/2022"
        email_address = "bob@mailinator.com"
        phone = "+1-202-555-0179"
        residential_address = "Main Street, Avenue Road, Somewhere in the World."
        basket = []
        self.registeredCustomer = Customer(name, dob, email_address, phone, residential_address, basket)

    def tearDown(self):
        name = "Bob"
        dob = "13/09/2022"
        email_address = "bob@mailinator.com"
        phone = "+1-202-555-0179"
        residential_address = "Main Street, Avenue Road, Somewhere in the World."
        basket = []
        self.registeredCustomer = Customer(name, dob, email_address, phone, residential_address, basket)


    def test_register_a_customer(self):
        """
        Test that customer script can register a customer
        """
        name = "Bob"
        dob = "13/09/2022"
        email_address = "bob@mailinator.com"
        phone = "+1-202-555-0179"
        residential_address = "Main Street, Avenue Road, Somewhere in the World."
        basket = []
        self.assertEqual(self.registeredCustomer.name, name)
        self.assertEqual(self.registeredCustomer.basket, basket)
        self.assertEqual(self.registeredCustomer.dob, dob)
        self.assertEqual(self.registeredCustomer.email_address, email_address)
        self.assertEqual(self.registeredCustomer.phone, phone)
        self.assertEqual(self.registeredCustomer.residential_address, residential_address)

    @unittest.skip("Not implemented yet")
    def test_check_product_and_not_buy(self):
        """
        Test that a customer can check a product
        """
        result = self.registeredCustomer.checkProduct()
        self.assertEqual(result, expected)
        

    @unittest.skip("Not implemented yet")
    def test_check_product_that_doesnt_exist(self):
        """
        Test that a customer can't check a non-existing product 
        """
        result = self.registeredCustomer.checkProduct()
        expected = None
        self.assertEqual(result, expected)

    def test_buy(self):
        """
        Test buy a product
        """
        pass



if __name__ == "__main__":
    unittest.main()

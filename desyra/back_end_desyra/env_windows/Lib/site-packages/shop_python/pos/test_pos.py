from .pos import POS

import unittest

class TestPOS(unittest.TestCase):
    def setUp(self):
        self.pos = POS(0.0)

    def test_put_money_in(self):
        """
        Test adding money into POS
        """
        expected = 12.30
        self.pos.money_in(12.30)
        self.assertEqual(self.pos.balance, expected)

    def test_take_money_out(self):
        """
        Test adding money into POS
        """
        expected = 1.0
        self.pos.money_in(12.30)
        self.pos.money_out(11.30)
        self.assertEqual(self.pos.balance, expected)

if __name__ == "__main__":
    unittest.main()

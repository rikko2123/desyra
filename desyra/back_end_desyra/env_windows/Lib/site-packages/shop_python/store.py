from dataclasses import dataclass
from typing import List
from shop_python.product.product import Product
from shop_python.pos.pos import POS


@dataclass
class Store:
    _name: str
    _products: List[Product]
    _pos: POS

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, name):
        try:
            if len(name) > 0:
                self._name = name
            else:
                raise ValueError
        except ValueError:
            raise ValueError("Shop name must not be empty")
        return self._name

    @property
    def stock(self):
        return self._products

    @stock.setter
    def stock(self, product: Product):
        self._products.append(product)
        return self._products

    @property
    def pos(self):
        return self._pos

    @pos.setter
    def pos(self, starting_balance):
        try:
            if float(starting_balance) >= 0:
                self._pos = starting_balance
                return self._pos
            else:
                raise ValueError
        except ValueError:
            raise ValueError(
                "Starting POS amount must be greater than or equal to 0")
        except TypeError:
            raise TypeError("Starting POS amount must be a float.")

    def displayProducts(self, cli: bool = False) -> List[str]:
        """
        Returns a list of products to display
        """
        display_results = []
        for product in self.stock:
            result = f"{product.name} ${product.price} - instock: {product.quantity}"
            if cli:
                print(result)
            display_results.append(result)
        return display_results

    def displayProduct(self, item: str, cli: bool = False) -> str:
        """
        Returns a product to display
        """
        item = item.lower()
        result = ""
        for product in self.stock:
            if product.name.lower() == item:
                result = f"{product.name} - ${product.price}\n{product.description}\nThere are {product.quantity} left"
                if cli:
                    print(result)
        return result

    def calculateTotalPrice(self, basket: List[Product], cli: bool = False) -> float:
        """
        Calculates the total checkout price from a list of basket of Products.
        @param:basket is the customer's basket, which is a list of Products.
        @returns float
        """
        total_checkout_price = 0
        if cli:
            print("Product | Unit Price ($) | Quantity | Total Price")
        for product in basket:
            if cli:
                print(
                    f"{product.name} x {product.price} x {product.quantity} = {product.price * product.quantity} ")
            total_checkout_price += product.price*product.quantity
        if cli:
            print(f"Your total price = {total_checkout_price}")
        return total_checkout_price

    def checkout(self, total_price: float, basket: List[Product], payment_method: str = None) -> None:
        """
        Prompts for checkout options and proceed for sale depending on the option.
        This will call the sale() function.
        @returns None
        """
        if payment_method == None:
            payment_method = input(
                "How would you like to make your payment?\n1. Cash\n2. Card\n")
        if payment_method.upper() in ('1', '1.', 'CASH', 'CAS', 'MONEY', 'DOLLAR'):
            self.sale("cash", total_price, basket)
        if payment_method.upper() in ('1', '1.', 'CARD', 'CAR', 'BANK', 'TRANSFER'):
            self.sale("card", total_price, basket)

    def cash_payment(self, total_price: float, basket: List[Product], payment_info: dict = None, cli: bool = False) -> bool:
        """
        If sufficient or greater than checkout price,
        provide change, add money into POS, adjust product quantity of each product in the store, issue receipt.
        @param:payment_info is expecting a dict. E.g. {"cash": 100.99}
        @returns bool
        """
        if payment_info == None:
            payment_info = {}
            paying_amount = input(
                f"How much do you wanna pay for {total_price}?\n")
            payment_info['paying_amount'] = paying_amount
            print(
                "Received ${paying_amount} for your total checkout price: ${total_price}")
        if payment_info['cash'] < total_price:
            if payment_info == None:
                if cli:
                    print(
                        "Not enough cash.\nReturning your money.\nPlease provide more than or equal to the total checkout price of ${total_price}")
            self.cash_payment(total_price, basket, None)
        if payment_info['cash'] >= total_price:
            change = payment_info['cash'] - total_price
            if cli:
                print(f"Your change is ${change}.")
            self.pos.money_in(total_price)
            for product in basket:
                for stock in self.stock:
                    if product.uniqueId == stock.uniqueId:
                        stock.decrease_quantity(product.quantity)
            return True
        return False

    def card_payment(self, total_price: float, basket: List[Product], payment_info: dict = None) -> bool:
        """
        If sufficient or greater than checkout price,
        provide change, add money into POS, adjust product quantity of each product in the store, issue receipt.
        @param:payment_info is expecting a dict. E.g.
            {
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
        @returns bool
        """
        if payment_info == None:
            payment_info = {}
            card_number = input("Enter your card number: ")
            card_expiry_year = input("Enter your card expiry year: ")
            card_expiry_month = input("Enter your card expiry month: ")
            card_cvv = input("Enter your card CVV: ")
            payment_info['card']['number'] = card_number
            payment_info['card']['expiry']['month'] = card_expiry_month
            payment_info['card']['expiry']['year'] = card_expiry_year
            payment_info['card']['cvv'] = card_cvv
        # self.pos.money_in(total_price) # TODO: separate cash drawer balance and bank account balance.
        for product in basket:
            for stock in self.stock:
                if product.uniqueId == stock.uniqueId:
                    stock.decrease_quantity(product.quantity)
        return True

    def sale(self, payment_instrument: str, total_price: float, basket: List[Product]) -> bool:
        """
        If cash, prompts the user how much to pay.
        If card, prompts for "card details" (will not be validated).

        If sufficient or greater than checkout price,
        provide change, add money into POS, adjust product quantity of each product in the store, issue receipt.
        """
        if payment_instrument == "cash":
            self.cash_payment(total_price, basket, None)
            self.receipt("yes")
            return True
        if payment_instrument == "card":
            self.card_payment(total_price, basket, None)
            self.receipt("yes")
            return True
        return False

    def receipt(self, send_receipt: str = None, cli: bool = False) -> bool:
        if send_receipt == None:
            send_receipt = input("Do you want a receipt? (Y/N)")
        if send_receipt.upper() in ('Y', 'YE', 'YES', 'OK', 'K', 'WHATEVER', 'ALRIGHT', 'BET', 'DO IT', 'MAKE IT SO', True):
            if cli:
                print("Receipt printed and sent to you")
            return True
        return False

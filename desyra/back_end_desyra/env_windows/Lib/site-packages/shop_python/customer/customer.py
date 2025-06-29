from dataclasses import dataclass
from typing import List, Dict
from shop_python.customer.person import Person


@dataclass
class Customer(Person):
    _basket: List[Dict]

    @property
    def basket(self):
        return self._basket

    @basket.setter
    def basket(self, product: Dict) -> List[dict]:
        """
        Triggers from `buy()`
        @param:item is a Product class
        """
        try:
            if quantity is None:
                quantity = int(
                    input(f"How many do you want to buy out of {item.quantity}?\n"))
            if quantity > item.quantity:
                if cli:
                    print("Sorry! We don't have that many!")
                self.addingToCart(item)
            if quantity < 0:
                raise ValueError("Not a valid number")
            return self.addToCart(item, quantity)
        except ValueError:
            if cli:
                print("Not a valid number")
            self.addingToCart(item)

    def checkProduct(self, item: str, cli: bool = False) -> str:
        """
        Customer can check a product description
        @param:from_store is the Store class
        """
        selected = from_store.displayProduct(item)
        if len(selected) <= 0:
            result = f"{item} not found."
            if cli:
                print(result)
            return result
        return selected

    def buy(self, item: dict, choice: str = None, quantity: int = 1, cli: bool = False) -> bool:
        """
        @param:item is a dictionary for Product class
        """
        if choice is None:
            choice = input(f"Want to buy {item.name}? (Y/N)\n")
        if choice.upper() in ("Y", "YES", "YE", "OK", "ALRIGHT", "K"):
            if cli:
                try:
                    quantity = int(input(f"How many do you wanna buy?\n"))
                    if quantity <= 0:
                        raise ValueError
                except TypeError as e:
                    print(e)
                except ValueError:
                    raise ValueError(
                        "Quantity amount needs to be a number, greater than 0.") from e

                    self.buy(item, "YES", 0, cli)
            return self.addToCart(item, quantity)
        elif choice.upper() in ("N", "NO", "NYET", "NOPE"):
            return False
        else:
            print("Invalid choice")
            self.buy(item)

    def addToCart(self, item: dict, amount: int, from_store, cli: bool = False) -> None:
        """
        @param:item is the Product class
        @param:from_store is the Store class
        """
        if len(self.basket) == 0:
            selected = from_store.displayProduct(item)
            self.basket.append(selected)
        else:
            for basket_item in self.basket:
                if item.uniqueId == basket_item.uniqueId:
                    to_add = "YES"
                    if cli:
                        print(
                            f"There's already {basket_item.name} in your basket.")
                        to_add = input(
                            f"Do you want to add an additional {amount} of {basket_item.name} to your existing {basket_item.quantity}? (Y/N)\n")
                    if to_add.upper() in ["Y", "YES", "YE"]:
                        basket_item.increase_quantity(amount)
                    if cli:
                        print("Updated to cart")
                else:
                    selected = from_store.displayProduct(item)
                    self.basket.append(selected)
        if cli:
            print(f"Your cart:\n{self.basket}\n")
        return self.basket

    def checkout(self, cli: bool = False):
        if len(self.basket) <= 0:
            shop_around = input(
                "There's nothing in your basket? Did you want to shop around some more? (Y/N)\n")
            if shop_around.upper() in ('Y', 'YE', 'YES', 'OK'):
                return None


if __name__ == '__main__':
    bob = Customer("Bob", [])
    apple = Store("Apple")

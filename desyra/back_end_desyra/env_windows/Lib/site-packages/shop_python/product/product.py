from dataclasses import dataclass


@dataclass(unsafe_hash=True)
class Product:
    _uniqueId: str
    _name: str
    _price: float
    _description: str
    _quantity: int

    @property
    def uniqueId(self) -> str:
        return self._uniqueId

    @property
    def name(self) -> str:
        return self._name

    @name.setter
    def name(self, name: str) -> str:
        try:
            if not name:
                raise ValueError
            else:
                self._name = name
        except ValueError:
            raise ValueError("There must be a Product Name") from None
        return self._name

    def change_name(self, new_name: str) -> None:
        self.name = new_name

    @property
    def description(self) -> str:
        return self._description

    @description.setter
    def description(self, new_description: str) -> str:
        try:
            if not new_description:
                raise ValueError
            else:
                self._description = new_description
        except ValueError:
            raise ValueError("There must be a Product description") from None
        return self._description

    def change_description(self, new_description: str) -> None:
        self.description = new_description

    @property
    def price(self) -> float:
        return self._price

    @price.setter
    def price(self, amount: float):
        try:
            self._price = round(float(amount), 2)
        except ValueError:
            raise ValueError("Price must be a float") from None
        return self._price

    def increase_price(self, amount: int):
        self.price += amount

    def decrease_price(self, amount: int):
        self.price -= amount

    @property
    def quantity(self) -> int:
        return self._quantity

    @quantity.setter
    def quantity(self, amount: int):
        try:
            self._quantity = int(amount)
        except ValueError:
            raise ValueError("quantity must be a number") from None
        return self._quantity

    def increase_quantity(self, amount: int):
        self.quantity += amount

    def decrease_quantity(self, amount: int):
        self.quantity -= amount


if __name__ == '__main__':
    sku = "test001"
    name = "Test Apple"
    price = 9999.99
    description = "Red Apple"
    quantity = 3
    sku2 = "test002"
    name2 = "Test Banana"
    price2 = 1234.50
    description2 = "Yellow Banana"
    quantity2 = 2

    apple = Product(sku, name, price, description, quantity)
    banana = Product(sku2, name2, price2, description2, quantity2)

    cart = {apple, banana}
    print(cart)

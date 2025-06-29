from dataclasses import dataclass


@dataclass
class POS:
    _balance:float

    @property
    def balance(self):
        return self._balance

    @balance.setter
    def balance(self, balance:float) -> float:
        try:
            self._balance = round(float(balance), 2)
        except ValueError:
            raise ValueError("Amount needs to be a float. Preferably already calculated to 2 decimal places") from None
        return self._balance

    def money_in(self, amount:float) -> float:
        if amount > 0:
            self.balance += amount
            return self.balance
        elif amount == 0:
            return self.balance
        else:
            raise ValueError("Did you mean to use 'money_out'?") from None

    def money_out(self, amount:float) -> float:
        if amount > 0 and self.balance > amount:
            self.balance -= amount
            return self.balance
        elif amount == 0:
            return self.balance
        elif amount > 0 and self.balance < amount:
            raise ValueError("Not enough money in POS.") from None
        else:
            raise ValueError("Did you mean to use 'money_in'?") from None

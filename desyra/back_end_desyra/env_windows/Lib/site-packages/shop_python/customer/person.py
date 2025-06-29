from dataclasses import dataclass
from datetime import datetime
import re

@dataclass
class Person:
    _name:str
    _dob:datetime
    _email_address:str
    _phone:str
    _residential_address:str

    @property
    def name(self) -> str:
        return self._name

    @name.setter
    def name(self, new_name:str) -> str:
        try:
            if len(new_name) > 0:
                self._name = new_name
                return self._name
            else:
                raise ValueError
        except ValueError:
            raise ValueError("Name must not be empty.")

    @property
    def dob(self) -> str:
        return self._dob

    @dob.setter
    def dob(self, new_dob:datetime) -> str:
        format_a = "%d/%m/%Y"
        try:
            ddmmyy_parser = datetime.datetime.strptime(new_dob, format_a).strftime(format_a)
            self._dob = ddmmyy_parser
            return self._dob
        except ValueError:
            raise ValueError("Date of Birth format must be dd/mm/yy")

    @property
    def email_address(self) -> str:
        return self._email_address

    @email_address.deleter
    def email_address(self) -> None:
        del self._email_address

    @email_address.setter
    def email_address(self, new_email_address:str) -> str:
        #email_regex = r"(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))"
        #matches = re.search(new_email_address, email_regex)
        self._email_address = new_email_address
        #raise NotImplementedError

    @property
    def phone(self) -> str:
        return self._phone

    @phone.setter
    def phone(self, new_phone:str):
        try:
            if len(new_phone) > 0:
                self._phone = new_phone
                return self._phone
            else:
                raise ValueError
        except ValueError:
            raise ValueError("Phone number must be valid")

    @property
    def residential_address(self) -> str:
        return self._residential_address

    @residential_address.setter
    def residential_address(self, new_address:str) -> str:
        try:
            if len(new_address) > 0:
                self._residential_address = new_address
                return self._residential_address
            else:
                raise ValueError
        except ValueError:
            raise ValueError("Address text must not be empty")

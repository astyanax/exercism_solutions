from threading import Lock
class BankAccount:
    
    def __init__(self):
        self.active = False
        self.balance = 0
        self.lock = Lock()
    
    def get_balance(self):
        with self.lock:
            if not self.active:
                raise ValueError("account not open")
            return self.balance
    
    def open(self):
        with self.lock:
            if self.active:
                raise ValueError("account already open")
            self.active = True
    
    def deposit(self, amount):
        if amount <= 0:
            raise ValueError("amount must be greater than 0")
        with self.lock:
            if not self.active:
                raise ValueError("account not open")
            self.balance += amount
    
    def withdraw(self, amount):
        with self.lock:
            if not self.active:
                raise ValueError("account not open")
            if amount > self.balance:
                raise ValueError("amount must be less than balance")
            if amount <= 0:
                raise ValueError("amount must be greater than 0")
            self.balance -= amount
    
    def close(self):
        with self.lock:
            if not self.active:
                raise ValueError("account not open")
            self.balance = 0
            self.active = False

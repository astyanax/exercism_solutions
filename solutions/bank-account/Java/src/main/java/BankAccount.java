class BankAccount {
    private boolean isOpen;
    private int balance;

    void open() throws BankAccountActionInvalidException {
        if (isOpen) {
            throw new BankAccountActionInvalidException("Account already open");
        }
        isOpen = true;
        balance = 0;
    }

    void close() throws BankAccountActionInvalidException {
        if (!isOpen) {
            throw new BankAccountActionInvalidException("Account not open");
        }
        isOpen = false;
    }

    synchronized int getBalance() throws BankAccountActionInvalidException {
        if (!isOpen) {
            throw new BankAccountActionInvalidException("Account closed");
        }
        return balance;
    }

    synchronized void deposit(int amount) throws BankAccountActionInvalidException {
        if (!isOpen) {
            throw new BankAccountActionInvalidException("Account closed");
        }
        if (amount <= 0) {
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        }
        balance += amount;
    }

    synchronized void withdraw(int amount) throws BankAccountActionInvalidException {
        if (!isOpen) {
            throw new BankAccountActionInvalidException("Account closed");
        }
        if (amount <= 0) {
            throw new BankAccountActionInvalidException("Cannot deposit or withdraw negative amount");
        }
        if (balance < amount) {
            throw new BankAccountActionInvalidException("Cannot withdraw more money than is currently in the account");
        }
        balance -= amount;
    }
}
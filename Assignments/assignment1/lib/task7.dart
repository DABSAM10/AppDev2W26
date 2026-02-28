void main() {
  BankAccount a1 = new BankAccount(03984, "John", 120.54);

  a1.deposit(10.50);
  a1.withdraw(25.75);
  a1.withdraw(200.00);
}

class BankAccount {
  int accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Balance after deposit: $balance");
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("Balance after withdraw: $balance");
    } else {
      print("Insufficient balance!");
    }
  }
}
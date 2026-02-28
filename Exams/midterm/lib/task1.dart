void main() {
  calculateBill('Apple', 1.50, 4);
  calculateBill('Milk', 2.75, 2);
  calculateBill('Bread', 3.00, 1);
}

void calculateBill([String? itemName, double? price, int? quantity]) {
  double total = price! * quantity!;

  print("Item: $itemName\t | Price: \$$price | Qty: $quantity | Total: \$$total");
}
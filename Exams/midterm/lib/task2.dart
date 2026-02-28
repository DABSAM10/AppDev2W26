void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  int doubleEachNumber(int number) {
    return number * 2;
  }

  int squareEachNumber(int number) {
    return number * number;
  }

  int addTenEachNumber(int number) {
    return number + 10;
  }

  print(applyToAll(numbers, doubleEachNumber));
  print(applyToAll(numbers, squareEachNumber));
  print(applyToAll(numbers, addTenEachNumber));
}

List<int> applyToAll(List<int> numbers, int Function(int) operation) {
  List<int> newList = [];

  for (var num in numbers) {
    newList.add(operation(num));
  }

  return newList;
}
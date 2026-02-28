void main() {
  List<int> input = [1, 2, 3, 2, 4, 5, 3, 6];

  print("Output: ${findUniqueElements(input)}");
}

List<int> findUniqueElements(List<int> numbers) {
  return numbers.toSet().toList(); // toSet() return only unique element from the list
}
void main() {
  List<int> nums = [1, 2, 3, 4, 5];

  int function(int num) {
    return num;
  }

  int output = sumOfSquares(nums, function);
  print("Output: $output");
}

int sumOfSquares(List<int> numbers, int Function(int) sumSquare) {
  int sum = 0;

  for (var number in numbers) {
    int result = sumSquare(number);
    sum += result * result;
  }

  // numbers.forEach((number) {
  //   int result = sumSquare(number);
  //   sum += result * result;
  // });

  return sum;
}
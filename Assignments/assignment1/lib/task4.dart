void main() {
  print(sum([5, 10, 15, 20]));
  print(sum());
}

int sum([List<int>? nums]) {
  if (nums == null) {
    return 0;
  }

  int result = 0;
  for (var num in nums) {
    result += num;
  }

  return result;
}
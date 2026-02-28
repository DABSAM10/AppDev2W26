void main() {
  List<int> scores = [45, 82, 67, 90, 55, 78, 91, 40, 73, 88];

  var result = scores
      .where((x) => x >= 70)
      .map((x) {
        if (x >= 90) {
          x == 'A';
        } else if (x >= 80 && x < 90) {
          x == 'B';
        } else if (x >= 70 && x < 80) {
          x == 'C';
        }
      })
      .toList();

  // var highest = result.reduce();

  print(result);
}
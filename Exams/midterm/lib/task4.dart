import 'dart:math';

void main() {
  List<String> users = ['1', '2', '3', '4', '5'];

  Random random = new Random();
  int score = random.nextInt(101);

  users.forEach((user) {
    fetchUserData(user, score);
  });

  // fetchUserData("1", score);
}

Future<void> fetchUserData(String user, int score) async {
  await Future.delayed(Duration(seconds: 1));
  print("User_$user-Score: $score");
  // for (int i = 1; i <= 5; i++) {
  //
  // }
}
void main() {
  delayedPrint("Flutter Dart", 3000);
}

Future<void> delayedPrint(String message, int delayTime) async {
  await Future.delayed(Duration(milliseconds: delayTime), () {
    print(message);
  });
}
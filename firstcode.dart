import 'dart:io';

void main(){
  print("Example of Assignment operators");
  var n1 = 10;
  var n2 = 5;

  // code for reversed number
  var givenNumber = 643;
  var remainder = 0;
  var reversedNumber = 0;

  while(givenNumber > 0) {
    remainder = givenNumber % 10; // 643 % 10 = 3, 64 % 10 = 4, 6 % 10 = 6
    reversedNumber = reversedNumber * 10 + remainder; // 3, 34, 346
    givenNumber = givenNumber ~/ 10; // 643 / 10 = 64, 6
  }

  print(reversedNumber);

  // fibonacci
  var firstNum = 0;
  var secondNum = 1;
  var thirdNum = 0;

  print(firstNum);
  print(secondNum);

  for(int i = 0; i < 9; i++) {
    thirdNum = firstNum + secondNum;
    print(thirdNum);
    firstNum = secondNum;
    secondNum = thirdNum;
  }

  // factorial
  var fact = 1;

  for(int i = 1; i <= 5; i++) {
    fact = fact * i;
  }

  print(fact);

  // nested loop
  for(int i = 0; i < 5; i++) {
    for(int j = 0; j <= i; j++) {
      stdout.write("* ");
    }
    print(' ');
  }

  for(int i = 1; i < 5; i++) {
    for(int j = 0; j < i; j++) {
      stdout.write(i + j);
    }
    print(' ');
  }

  var newvar = null;
  print(newvar);

  int? newVar = null;
}
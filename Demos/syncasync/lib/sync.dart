import 'dart:io';

class A {
  var first;
  var _second;

  String get second {
    return _second;
  }

  void set second(String second) {
    this._second = second;
  }
}

class Student {
  Student() {
    print('Inside Student Constructor');
  }

  Student.namedConst(String stCode) {
    print(stCode);
  }
}

class Laptop {
  // Constructor
  Laptop({var name, var color}) {
    print('Laptop Constructor');
    print('Name: $name');
    print('Color: $color');
  }

  Laptop.named() {
    print("Laptop Constructor");
  }
}

class MacBook extends Laptop {
  // Constructor
  MacBook({var name, var color}) : super(name: name, color: color) { // Named Parameters
    // print('MacBook Constructor');
    print('$color $name');
  }

  // MacBook() : super.named() {
  //   print('MacBook Constructor');
  // }
}

void main() {
  //**
  var i = null; // default var is null
  var j = 0; // this is non-nullable
  i = j;
  int? p = null; // by using ? this is nullable
  // print(i);
  // print(j);

  //**
  // print('Enter x');
  // var x = double.parse(stdin.readLineSync()!);
  // print('Enter y');
  // var y = double.parse(stdin.readLineSync()!);
  //
  // var sum = x + y;
  // print('sum =  $sum');
  // var average =sum / 2;
  //
  // print('average = $average');

  //**
  var words = ['sky', 'cloud', 'rain'];

  // words.forEach((String word) {
  //   print('$word has ${word.length} characters');
  // });

  //**
  // A a = new A();
  // a.first = 'New First';
  // a._second = 'New Second';
  // print('${a.first}: ${a._second}');

  //**
    int r1 = apply(3, inc);
    int r2 = apply(7, dec);
    // print(r1);
    // print(r2);

  //**
  //   Student s1 = new Student();
  //   Student s2 = new Student.namedConst('St001');

  //**
  //   var macbook = MacBook(name: "MacBook Pro", color: "Silver");
  //   var macBook = MacBook();

  //**
  print(pow(2, 2));
  print(pow(2, 4));
  print(pow(2));
}

int inc(int x) => ++x;

int dec(int x) => --x;

int apply(int x, Function f) {
  return f(x);
}

int pow(int x, [int y = 2]) { // Optional Positional Parameters
  int r = 1;
  for (int i = 0; i < y; i++) {
    r *= x;
  }
  return r;
}
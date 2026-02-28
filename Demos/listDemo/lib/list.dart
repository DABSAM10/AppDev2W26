import 'package:flutter/material.dart';
import 'dart:math' as m;

void main() {
  // Creating a list
  var list1 = <int>[];
  list1.add(10);
  list1.add(5);
  list1.add(14);
  list1.add(3);
  list1.add(1);
  print(list1);

  // Finding least number in a list of int
  var leastNum = list1[0];

  for (int i = 1; i < list1.length; i++) {
    if (list1[i] < leastNum) {
      leastNum = list1[i];
    }
  }

  print('The least number is $leastNum');

  // Creating a set
  var mySet = <String>{};

  // Adding element to the set
  mySet.add("apple");
  mySet.add("banana");
  mySet.add("orange");
  mySet.add("apple");

  print(mySet);

  // Check if set contains a specific element
  print(mySet.contains("orange"));
  print(mySet.contains("cherry"));

  // Removing a element from the set
  mySet.remove("apple");
  print(mySet);

  //Creating a map
  var myMap = <String, int>{};

  // Adding key-value pairs to the map
  myMap['apple'] = 3;
  myMap['banana'] = 8;
  myMap['cherry'] = 2;

  print(myMap);

  // Accessing value using key
  print(myMap['cherry']);

  // Checking if a map contains specif key
  print(myMap.containsKey('apple'));

  // Removing a key-value pair from the map
  myMap.remove('banana');
  print(myMap);

  // Check the largest number between some int
  var n1 = 87;
  var n2 = 29;
  var n3 = 95;

  if (n1 > n2) {
    if (n1 > n3) {
      print('n1 is greater');
    } else {
      print('n3 is greater');
    }
  } else if (n2 > n3) {
    print('n2 is greater');
  } else {
    print('n3 is greater');
  }

  // Anonymous function
  var list = ["James", "Matthew", "Arthur", "John"];

  print("Example of Anonymous function");

  list.forEach((item) {
    print('${list.indexOf(item)}: $item'); // or {$item}
  });

  // Factorial of given number using a recursive function
  var factNum = 8;
  var factResult = calculateFactorial(factNum);

  print('Factory of ${factNum} is $factResult');

  // Anonymous function using Lambda Expression
  var multiply = (int a, int b) => a + b;

  var result = multiply(5, 6);
  print(result);

  // Create object of child class
  // Dynamic Polymorphism
  Shape s = Circle();
  s.perimeter();
  s.area();

  s = Square();
  s.perimeter();
  s.area();

  // Convert Fahrenheit to Celsius
  double tempFahrenheit = 61.34;
  double tempCelsius = (tempFahrenheit - 32) / 1.8;

  print(
    '${tempFahrenheit.toStringAsFixed(1)}F = ${tempCelsius.toStringAsFixed(1)}C');
}

calculateFactorial(int factNum) {
  if (factNum <= 1) {
    return 1;
  } else {
    return factNum * calculateFactorial(factNum - 1);
  }
}

abstract class Shape {
  // Declaring abstract methods
  perimeter();
  area();
}

class Circle extends Shape {
  var radius = 3;

  // Overriding method
  @override
  perimeter() {
    var result =  2 * m.pi * radius;
    print(result);
  }

  // Overriding method
  @override
  area() {
    var result = m.pi * radius * radius;
    print(result);
  }
}

class Square extends Shape {
  var side = 6;

  @override
  area() {
    var result = side * side;
    print(result);
  }

  @override
  perimeter() {
    var result = 4 * side;
    print(result);
  }
}
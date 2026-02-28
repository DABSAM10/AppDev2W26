void main() {
  Person p1 = Person.fromNameAndAge("John", 28);

  print("Name: ${p1.name}\nAge: ${p1.age}"); // Access via Constructor
  // print(p1); // Access via toString() method
}

class Person {
  var name;
  var age;

  Person.fromNameAndAge(String name, int age) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'Name: $name\nAge: $age';
  }
}
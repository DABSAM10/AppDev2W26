class Dog {
  final int id;
  final String name;
  final int age;

  // This is important to map function whenever we store the data to db, we have to map the dart object to db object and vice versa
  // That is why we have to use the map function and it applies to ant kind of data transaction
  Dog({
    required this.id,
    required this.name,
    required this.age
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
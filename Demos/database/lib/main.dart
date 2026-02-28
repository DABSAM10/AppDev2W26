import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:path/path.dart';
import 'dogmodel.dart';

void main() async {
  // This line will connect all the flutter widgets to the db permanently
  // This ensures the connection between db to flutter app
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    // join function connects the app to db memory
    // getDatabasesPath will create the memory for database itself
      join(await getDatabasesPath(), 'doggie_database.db'),
      // then create the database and table
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dogs (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1
  );

  Future<void> insertDog(Dog dog) async {
    final db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // This line will get rid of error if make mistake in primary key
    );
  }

  var fido = Dog(
      id: 0,
      name: 'Fido',
      age: 3
  );

  await insertDog(fido);

  // Write a function to display the dog objects the tuples (rows) could be many call the list objects to access all the table content by row wise
  Future<List<Dog>> dogs() async {
    final db = await database;
    // List will give access to all the rows
    // Map will  help extract the value in each row by indexing the column value (key
    final List<Map<String, Object?>> dogmaps = await db.query('dogs');
    return [
      for (final dogmap in dogmaps)
      // convert db to dart object
        Dog(
            id: dogmap['id'] as int,
            name: dogmap['name'] as String,
            age: dogmap['age'] as int
        )
    ];
  }

  print(await dogs());

  // Write a function to update
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
        'dogs',
        dog.toMap(),
        where: 'id = ?', // ? replaces the value given by the user
        whereArgs: [dog.id] // id is primary key and value given here will be searched in the table
    );
  }

  fido = Dog(
      id: fido.id,
      name: fido.name,
      age: fido.age + 3
  );

  await updateDog(fido);
  print(await dogs());

  // Write a function to delete am instance
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete(
        'dogs',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  await deleteDog(fido.id);
  print(await dogs());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

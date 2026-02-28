import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'Dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDBDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDBDemo extends StatefulWidget {
  const MyDBDemo({super.key});

  @override
  State<MyDBDemo> createState() => _MyDBDemoState();
}

class _MyDBDemoState extends State<MyDBDemo> {
  // create an instance for the database
  // the keyword late says that this instance will get the value in late
  late Database database;

  // create a container that stores the dog instances
  List<Dog> dogList = [];

  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();

  // this state will be called when you run the app
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB(); // this fn will create the db and open the db for data manipulation
  }

  Future<void> initDB() async {
    database =
    await openDatabase(join(await getDatabasesPath(), 'doggie_db.db'),
        onCreate: (db, version) {
          return db.execute(
            'create table dogs(id integer primary key,name text, age integer)',
          );
        },
        version: 1);
    readDogs();
  }

  // create
  Future<void> insertDog() async {
    final dog = Dog(
        id: int.parse(idcontroller.text),
        name: namecontroller.text,
        age: int.parse(agecontroller.text));
    // now add this instance to the table dogs
    await database.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    clearfields();
    readDogs();
  }

  // read the dogs table
  Future<void> readDogs() async {
    final List<Map<String, Object?>> maps = await database.query('dogs');
    // when the user enters the second object, i want to display right away
    // it should be in setstate
    setState(() {
      // this is where I convert back from db to dart objects
      dogList = maps
          .map((map) => Dog(
          id: map['id'] as int,
          name: map['name'] as String,
          age: map['age'] as int))
          .toList();
    });
  }

  // update Dog

  Future<void> upDateDog() async {
    final dog = Dog(
        id: int.parse(idcontroller.text),
        name: namecontroller.text,
        age: int.parse(agecontroller.text));
    await database.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
    clearfields();
    readDogs();
  }

  // delete dog
  Future<void> deleteDog() async {
    int id = int.parse(idcontroller.text);
    await database.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
    clearfields();
    readDogs();
  }

  void clearfields() {
    idcontroller.clear();
    namecontroller.clear();
    agecontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Db Demo', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idcontroller,
              decoration: InputDecoration(labelText: 'Dog ID'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(labelText: 'Dog name'),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: agecontroller,
              decoration: InputDecoration(labelText: 'Dog age'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: insertDog, child: Text('create')),
                ElevatedButton(onPressed: readDogs, child: Text('read')),
                ElevatedButton(onPressed: upDateDog, child: Text('update')),
                ElevatedButton(onPressed: deleteDog, child: Text('delete')),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // create a listview that displays all the dog rows
            Expanded(
                child: ListView(
                  children: dogList.map((dog) {
                    return ListTile(
                      title: Text(dog.name),
                      subtitle: Text("age : ${dog.age} | Id : ${dog.id}"),
                    );
                  }).toList(),
                )
            ),
          ],
        ),
      ),
    );
  }
}
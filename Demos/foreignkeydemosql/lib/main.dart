import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MaterialApp(home: DogOwnerScreen()));
}

class DogOwnerScreen extends StatefulWidget {
  @override
  _DogOwnerScreenState createState() => _DogOwnerScreenState();
}

class _DogOwnerScreenState extends State<DogOwnerScreen> {

  late Database database;

  // Controllers
  final ownerIdController = TextEditingController();
  final ownerNameController = TextEditingController();

  final dogIdController = TextEditingController();
  final dogNameController = TextEditingController();
  final dogAgeController = TextEditingController();
  final dogOwnerIdController = TextEditingController();

  List<Map<String, dynamic>> dogList = [];

  @override
  void initState() {
    super.initState();
    initDB();
  }

  Future<void> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'dog_owner.db'),
      onCreate: (db, version) async {

        await db.execute('''
          CREATE TABLE owners(
            id INTEGER PRIMARY KEY,
            name TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE dogs(
            id INTEGER PRIMARY KEY,
            name TEXT,
            age INTEGER,
            ownerId INTEGER,
            FOREIGN KEY(ownerId) REFERENCES owners(id)
          )
        ''');
      },
      version: 1,
    );

    readDogs();
  }

  // ---------------- OWNER CRUD ----------------

  Future<void> insertOwner() async {
    await database.insert('owners', {
      'id': int.parse(ownerIdController.text),
      'name': ownerNameController.text,
    });

    ownerIdController.clear();
    ownerNameController.clear();
  }

  Future<void> deleteOwner() async {
    await database.delete(
      'owners',
      where: 'id = ?',
      whereArgs: [int.parse(ownerIdController.text)],
    );

    ownerIdController.clear();
  }

  // ---------------- DOG CRUD ----------------

  Future<void> insertDog() async {
    await database.insert('dogs', {
      'id': int.parse(dogIdController.text),
      'name': dogNameController.text,
      'age': int.parse(dogAgeController.text),
      'ownerId': int.parse(dogOwnerIdController.text),
    });

    clearDogFields();
    readDogs();
  }

  Future<void> updateDog() async {
    await database.update(
      'dogs',
      {
        'name': dogNameController.text,
        'age': int.parse(dogAgeController.text),
        'ownerId': int.parse(dogOwnerIdController.text),
      },
      where: 'id = ?',
      whereArgs: [int.parse(dogIdController.text)],
    );

    clearDogFields();
    readDogs();
  }

  Future<void> deleteDog() async {
    await database.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [int.parse(dogIdController.text)],
    );

    clearDogFields();
    readDogs();
  }

  Future<void> readDogs() async {
    final List<Map<String, dynamic>> result = await database.rawQuery('''
    SELECT
      dogs.id AS dogId,
      dogs.name,
      dogs.age,
      owners.id AS ownerId,
      owners.name AS ownerName
    FROM dogs
    LEFT JOIN owners
    ON dogs.ownerId = owners.id
  ''');

    setState(() {
      dogList = result;
    });
  }

  // ---------------- FILTER OPERATIONS ----------------

  Future<void> filterByOwner() async {
    final result = await database.rawQuery('''
    SELECT
      dogs.id AS dogId,
      dogs.name,
      dogs.age,
      owners.id AS ownerId,
      owners.name AS ownerName
    FROM dogs
    LEFT JOIN owners
    ON dogs.ownerId = owners.id
    WHERE owners.id = ?
  ''', [int.parse(dogOwnerIdController.text)]);

    setState(() {
      dogList = result;
    });
  }

  Future<void> filterByAge() async {
    final result = await database.query(
      'dogs',
      where: 'age > ?',
      whereArgs: [int.parse(dogAgeController.text)],
    );

    setState(() {
      dogList = result;
    });
  }
  
  Future<void> filterByDogName() async {
    final result = await database.rawQuery('''
     SELECT 
      dogs.id AS dogId,
      dogs.name,
      dogs.age,
      owners.id AS ownerId
      owners.name
    ''');
  }

  void clearDogFields() {
    dogIdController.clear();
    dogNameController.clear();
    dogAgeController.clear();
    dogOwnerIdController.clear();
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog & Owner CRUD"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [

            Text("Owner Section", style: TextStyle(fontWeight: FontWeight.bold)),

            TextField(controller: ownerIdController, decoration: InputDecoration(labelText: "Owner ID")),
            TextField(controller: ownerNameController, decoration: InputDecoration(labelText: "Owner Name")),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: insertOwner, child: Text("Add Owner")),
                ElevatedButton(onPressed: deleteOwner, child: Text("Delete Owner")),
              ],
            ),

            Divider(),

            Text("Dog Section", style: TextStyle(fontWeight: FontWeight.bold)),

            TextField(controller: dogIdController, decoration: InputDecoration(labelText: "Dog ID")),
            TextField(controller: dogNameController, decoration: InputDecoration(labelText: "Dog Name")),
            TextField(controller: dogAgeController, decoration: InputDecoration(labelText: "Dog Age")),
            TextField(controller: dogOwnerIdController, decoration: InputDecoration(labelText: "Owner ID (FK)")),

            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(onPressed: insertDog, child: Text("Create")),
                ElevatedButton(onPressed: readDogs, child: Text("Read")),
                ElevatedButton(onPressed: updateDog, child: Text("Update")),
                ElevatedButton(onPressed: deleteDog, child: Text("Delete")),
                ElevatedButton(onPressed: filterByOwner, child: Text("Filter Owner")),
                ElevatedButton(onPressed: filterByAge, child: Text("Age >")),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: dogList.map((dog) {
                  return ListTile(
                    title: Text(
                        "Dog ID: ${dog['dogId']} - ${dog['name']}"
                    ),
                    subtitle: Text(
                        "Dog Age: ${dog['age']} | Owner ID: ${dog['ownerId']} | Owner Name: ${dog['ownerName']}"
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
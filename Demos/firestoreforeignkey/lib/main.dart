import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Call the Firebase to initialize the app
  // because we want API to integrate to the platform
  // for seamless integration
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyB86t2t3Jo9UiI6Q3uJMQVIUNg6WT_1xrU",
        appId: "317176859197",
        messagingSenderId: "1:317176859197:android:022fea66f88b269e447854",
        projectId: "firestoreforeignkey"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FSForeignKey(),
    );
  }
}

class FSForeignKey extends StatefulWidget {
  const FSForeignKey({super.key});

  @override
  State<FSForeignKey> createState() => _FSForeignKeyState();
}

class _FSForeignKeyState extends State<FSForeignKey> {
  // In Fire Store, the files call Documents and a list of documents call Collection
  // This line will create a space in the cloud with a reference name Owners and Dogs
  CollectionReference owners = FirebaseFirestore.instance.collection('Owners');
  CollectionReference dogs = FirebaseFirestore.instance.collection('Dogs');
  Query currentQuery = FirebaseFirestore.instance.collection('Dogs');

  // Controllers
  final ownerIdController = TextEditingController();
  final ownerNameController = TextEditingController();

  final dogIdController = TextEditingController();
  final dogNameController = TextEditingController();
  final dogAgeController = TextEditingController();
  final dogOwnerIdController = TextEditingController();

  // ---------------- OWNER CRUD ----------------

  Future<void> addOwner() async {
    int? id = int.tryParse(ownerIdController.text);
    String name = ownerNameController.text;

    if (id != null && name.isNotEmpty) {
      await owners.doc(id.toString()).set({
        'ownerName': name,
      });

      setState(() {
        clearOwnerFields();
      });
    }
  }

  Future<void> deleteOwner() async {
    int? id = int.tryParse(ownerIdController.text);

    if (id != null) {
      await owners.doc(id.toString()).delete();
    }
    clearOwnerFields();
  }

  void clearOwnerFields() {
    ownerIdController.clear();
    ownerNameController.clear();
  }

  // ---------------- DOG CRUD ----------------

  Future<void> addDog() async {
    int? id = int.tryParse(dogIdController.text);
    String name = dogNameController.text;
    int? age = int.tryParse(dogAgeController.text);
    int? ownerId = int.tryParse(dogOwnerIdController.text);

    if (id != null && name.isNotEmpty && age != null && ownerId != null) {
      // Fetch owner
      // DocumentSnapshot ownerDoc = await owners.doc(ownerId.toString()).get();
      //
      // if (!ownerDoc.exists) {
      //   print("Owner does not exist");
      //   return;
      // }
      //
      // String ownerName = ownerDoc['ownerName'];

      await dogs.doc(id.toString()).set({
        'dogName': name,
        'dogAge': age,
        'ownerId': ownerId,
        // 'ownerName': ownerName
      });
    }
    clearDogFields();
  }

  Future<void> updateDog() async {
    int? id = int.tryParse(dogIdController.text);
    String name = dogNameController.text;
    int? age = int.tryParse(dogAgeController.text);
    int? ownerId = int.tryParse(dogOwnerIdController.text);

    await dogs.doc(id.toString()).update({
      'dogName': name,
      'dogAge': age,
      'ownerId': ownerId
    });
    clearDogFields();
  }

  Future<void> deleteDog() async {
    int? dogId = int.tryParse(dogIdController.text);

    if (dogId != null) {
      await dogs.doc(dogId.toString()).delete();
    }
    clearDogFields();
  }

  void filterByOwner() {
    int ownerId = int.parse(dogOwnerIdController.text);

    setState(() {
      currentQuery = dogs.where('ownerId', isEqualTo: ownerId);
    });
  }

  void filterByAge() {
    int age = int.parse(dogAgeController.text);

    setState(() {
      currentQuery = dogs.where('dogAge', isGreaterThan: age);
    });
  }

  void filterByDogName() {
    String name = dogNameController.text;

    setState(() {
      currentQuery = dogs
          .where('dogName', isGreaterThanOrEqualTo: name)
          .where('dogName', isLessThan: name + 'z');
    });
  }

  void clearDogFields() {
    dogIdController.clear();
    dogNameController.clear();
    dogAgeController.clear();
    dogOwnerIdController.clear();
  }

  void clearFields() {
    clearOwnerFields();
    clearDogFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog & Owner CRUD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(12),
        child: Column(
          children: [

            Text("Owner Section", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

            TextField(controller: ownerIdController, decoration:  InputDecoration(labelText: "Owner ID")),
            TextField(controller: ownerNameController, decoration: InputDecoration(labelText: "Owner Name")),

            SizedBox(height: 16,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: addOwner, child: Text("Add Owner")),
                ElevatedButton(onPressed: deleteOwner, child: Text("Delete Owner")),
              ],
            ),

            Divider(),

            SizedBox(height: 12,),

            Text("Dog Section", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

            TextField(controller: dogIdController, decoration: InputDecoration(labelText: "Dog ID")),
            TextField(controller: dogNameController, decoration: InputDecoration(labelText: "Dog Name")),
            TextField(controller: dogAgeController, decoration: InputDecoration(labelText: "Dog Age")),
            TextField(controller: dogOwnerIdController, decoration: InputDecoration(labelText: "Owner ID (FK)")),

            SizedBox(height: 16,),

            Wrap(
              spacing: 12,
              children: [
                ElevatedButton(onPressed: addDog, child: Text("Create")),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Update Dog'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: dogNameController,
                                  decoration: InputDecoration(
                                    hintText: "Enter new Name",
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  controller: dogAgeController,
                                  decoration: InputDecoration(
                                    hintText: "Enter new Age",
                                  ),
                                  // obscureText: true,
                                ),
                                SizedBox(height: 10,),
                                TextField(
                                  controller: dogOwnerIdController,
                                  decoration: InputDecoration(
                                    hintText: "Enter new Owner",
                                  ),
                                )
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  updateDog();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Update")),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Confirm Delete'),
                              content: Text('Are you sure you want to delete this credential from the database?'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancel')
                                ),
                                TextButton(
                                    onPressed: () {
                                      deleteDog();
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          }
                      );
                    },
                    child: Text("Delete")
                ),
                ElevatedButton(onPressed: filterByOwner, child: Text("Filter Owner")),
                ElevatedButton(onPressed: filterByAge, child: Text("Age >")),
                ElevatedButton(onPressed: filterByDogName, child: Text("Filter Dog")),
                ElevatedButton(onPressed: clearFields, child: Text("Clear"))
              ],
            ),

            SizedBox(height: 10),

            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: currentQuery.snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Text("Loading ...");
                      return ListView(
                        // Write a map function to convert to Fire Store data to Dart object
                        // Snapshot data is a complete docs and map to each doc to Dart object
                          children: snapshot.data!.docs.map((doc) {
                            return ListTile(
                              title: Text(
                                  "Dog ID: ${doc.id} - ${doc['dogName']}"
                              ),
                              subtitle: Text(
                                  "Dog Age: ${doc['dogAge']} | Owner ID: ${doc['ownerId']}" //  | Owner Name: ${doc['ownerName']}
                              ),
                            );
                          }).toList()
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}

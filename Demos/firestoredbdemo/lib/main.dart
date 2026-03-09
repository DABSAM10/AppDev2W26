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
        apiKey: "AIzaSyBRNZbByufV0wwdMWTqVYilCwahwp8p7lc",
        appId: "450511959923",
        messagingSenderId: "1:450511959923:android:1ef7e04900ad994b3b7706",
        projectId: "firestoresample-55b56"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FSDemoSample(),
    );
  }
}

class FSDemoSample extends StatefulWidget {
  const FSDemoSample({super.key});

  @override
  State<FSDemoSample> createState() => _FSDemoSampleState();
}

class _FSDemoSampleState extends State<FSDemoSample> {
  // In Fire Store, the files call Documents and a list of documents call Collection
  // This line will create a space in the cloud with a reference name Users
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  // String username = '';
  // String password = '';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
  // Add the data to the cloud
  Future<void> addUser() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      await users.add({'username': username, 'password': password});
      setState(() {
        username = '';
        password = '';
      });

      clearFields();
    }
  }

  // Update an entity(doc)
  Future<void> updateUser(String id) async {
    // await users.doc(id).update({'username': 'new name', 'password': 'vanier'});

    String username = usernameController.text;
    String password = passwordController.text;

    await users.doc(id).update({
      'username': username,
      'password': password
    });

    clearFields();
  }

  // Delete an entity(doc)
  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
    clearFields();
  }

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FS Demo"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          TextField(
            controller: usernameController,
            // onChanged: (value) => username = value,
            decoration: InputDecoration(hintText: "Enter Username"),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordController,
            // onChanged: (value) => password = value,
            decoration: InputDecoration(hintText: "Enter Password"),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
              onPressed: addUser,
              child: Text("Add to FS")
          ),
          SizedBox(height: 10,),
          // Expanded defies animation conflict between ListView and Column
          Expanded( // StreamBuilder: date is pulled in real-time
              child: StreamBuilder<QuerySnapshot>(
                // Snapshot is th DB chunk for data manipulation
                stream: users.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Text("Loading ...");
                  return ListView(
                    // Write a map function to convert to Fire Store data to Dart object
                    // Snapshot data is a complete docs and map to each doc to Dart object
                      children: snapshot.data!.docs.map((doc) {
                        return ListTile(
                          title: Text(doc['username']),
                          subtitle: Text('Password: ${doc['password']}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  // onPressed() => updateUser(doc.id),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Update Database'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: usernameController,
                                                decoration: InputDecoration(
                                                  hintText: "Enter new username",
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              TextField(
                                                controller: passwordController,
                                                decoration: InputDecoration(
                                                  hintText: "Enter new password",
                                                ),
                                                // obscureText: true,
                                              ),
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
                                                updateUser(doc.id);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit)
                              ),
                              IconButton(
                                  // onPressed: () => deleteUser(doc.id),
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
                                                    deleteUser(doc.id);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          );
                                        }
                                    );
                                  },
                                  icon: Icon(Icons.delete)
                              ),
                            ],
                          ),
                        );
                      }).toList()
                  );
                },
              )
          )
        ],
      ),
    );
  }
}

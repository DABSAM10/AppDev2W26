import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyNavigator extends StatelessWidget {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  // Create a list and move to second screen
  final List<String> items = ['IOS', 'Android', 'Windows', 'MacOS', 'Linux', 'Unix'];

  // const MyNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Click to go Second screen"),
            SizedBox(height: 20,),
            TextField(
              controller: login,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Enter a username'),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Enter a password'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  // Call the Navigator to connect two Routes
                  // Material Page Route MPR is used for transition that will call the destination Route
                  // Use named argument to send data from first to second screen
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen(data: 'Sample data',
                      userData: login.text, passwordData: password.text, Pcs: items
                      )));
                },
                child: Text('Login')
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // Since this class receives the data, it is temporary to create the place holder and constructor
  final String data;
  final String userData;
  final String passwordData;
  final List<String> Pcs;

  // It is required data object
  SecondScreen({required this.data, required this.userData,
    required this.passwordData, required this.Pcs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Second screen'),
            centerTitle: true
        ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text('Bienvenue'),
      //       SizedBox(height: 20,),
      //       ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //          },
      //           child: Text('Go Back')
      //       ),
      //       SizedBox(height: 20,),
      //       Text('Data from First screen: $data'
      //           '\nLogin: $userData'
      //           '\nPassword: $passwordData'
      //       ),
      //       SizedBox(height: 20,),
      //       ElevatedButton(
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => ThirdScreen()));
      //           },
      //           child: Text('Move Next')
      //       ),
      //       SizedBox(height: 20,),

    //   ],
    // ),
    // ),

            // Use the ListView Builder that iterates the container based on the index
            body: ListView.builder(
                itemCount: Pcs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Pcs[index]),
                  );
                }
            )
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Welcome to Third screen'),
            centerTitle: true
        ),
        body: Center(
            child: Column(
                children: [
                Text('Ciao'),
          ]
        )
        )
    );
  }
}

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBDApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyBDApp extends StatelessWidget {
  const MyBDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy BirthDay'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Happy Birthday', style: TextStyle(fontSize: 30),),
            ),
            Image.asset('assests/download.jpg'),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('To my friend'),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Style"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Headline 1', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              Text('Headline 2', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              // Body Text
              Text('Headline 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              Text('Headline 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Divider(),
              // More text properties
              Text(
                  'Full Textstyle',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 26,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 3,
                    wordSpacing: 5,
                    height: 2,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.redAccent,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationThickness: 3,
                    backgroundColor: Colors.blueAccent
                  ),
              )
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// This import will give all the functions to code on real material
import 'package:flutter/material.dart';

// Call a method to run the app which is a class itself
void main() {
  runApp(MyFirstPage());
}

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // This MaterialApp give the foundation for all the design to run
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column( // child represents one widget control
          children: [ // children represents multiple widget control
            // Text('Hi', style: TextStyle(fontSize: 30),),
            // SizedBox(height: 20,),
            // Text('Vanier'),
            // SizedBox(height: 20,),
            // // Design a clickable button
            // ElevatedButton(
            //     onPressed: () {
            //       // Anonymous function
            //       // Write a logic to pop up a message
            //       ScaffoldMessenger.of(context).
            //       showSnackBar(SnackBar(content: Text('Login Successful')));
            //     },
            //     child: Text('Login')),
            // SizedBox(height: 20,),
            // Container(
            //   height: 50,
            //   width: 50,
            //   color: Colors.lightBlueAccent,
            // ),
            // SizedBox(height: 10,),
            // Image.asset('asset/download.png',
            //   height: 400,
            //   width: 400,
            //   fit: BoxFit.cover,),
            // SizedBox(height: 10,),
            Row(
              children: [
                Image.asset('asset/download2.jpg',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,),
                Image.asset('asset/download.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,)
              ],
            ),
            Icon(
              Icons.beach_access,
              color: Colors.amberAccent,
              size: 40,),
            SizedBox(height: 10,),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 40,),
            SizedBox(height: 10,),
            Image.network("https://picsum.photos/536/354")
          ],
        ),
      ),
    );
  }
}


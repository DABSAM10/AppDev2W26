import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MyApp()); // Arrow function

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControllerDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerDemo extends StatefulWidget {
  const ControllerDemo({super.key});

  @override
  State<ControllerDemo> createState() => _ControllerDemoState();
}

class _ControllerDemoState extends State<ControllerDemo> {
  // This controls the user data that has been given to the text field
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  double result = 0;

  void sum() {
    double n1 = double.tryParse(num1.text) ?? 0; // If user doesn't give a value, then it will be 0
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() { // This function updates state of component
      result = n1 + n2;
    });
  }

  void substract() {
    double n1 = double.tryParse(num1.text) ?? 0; // If user doesn't give a value, then it will be 0
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() { // This function updates state of component
      result = n1 - n2;
    });
  }

  void multiply() {
    double n1 = double.tryParse(num1.text) ?? 0; // If user doesn't give a value, then it will be 0
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() { // This function updates state of component
      result = n1 * n2;
    });
  }

  void divide() {
    double n1 = double.tryParse(num1.text) ?? 0; // If user doesn't give a value, then it will be 0
    double n2 = double.tryParse(num2.text) ?? 0;
    setState(() { // This function updates state of component
      result = (n1 / n2) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller Demo', style: TextStyle(
            fontSize: 28,
            fontWeight:
            FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.cyanAccent,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter the first number'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Enter the second number'
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: sum, child: Text('+')),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: substract, child: Text('-')),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: multiply, child: Text('*')),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: divide, child: Text('/')),
                SizedBox(width: 10,),
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: sum,
                child: Text('Compute'),),
            SizedBox(height: 20,),
            Text(
              'Result: $result',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}


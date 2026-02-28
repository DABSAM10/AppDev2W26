import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LengthConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LengthConverter extends StatefulWidget {
  const LengthConverter({super.key});

  @override
  State<LengthConverter> createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  TextEditingController input = TextEditingController();
  TextEditingController output = TextEditingController();

  double result = 0.0;

  convert() {
    double i = double.tryParse(input.text) ?? 0;
    setState(() {
      result = i * 3.28;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter",
          style: TextStyle(fontSize: 24,)
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Length"),
            SizedBox(height: 15,),
            TextField(

              controller: input,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Input", labelStyle: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(15),
              // decoration: BoxDecoration(
              //   border: Border.all()
              // ),
              child: Text("Meter"),
            ),
            ElevatedButton(onPressed: convert, child: Icon(Icons.transform)),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              width: 250,
              child:
                Text("$result",
                style: TextStyle(fontSize: 30),),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(15),
              // decoration: BoxDecoration(
              //   border: Border.all()
              // ),
              child: Text("Foot"),
            ),
          ],
        )
      ),
    );
  }
}

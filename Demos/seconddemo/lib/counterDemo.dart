import 'package:flutter/material.dart';

void main() {
  runApp(CounterDemo());
}

class CounterDemo extends StatelessWidget {
  const CounterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CounterHome(),
        debugShowCheckedModeBanner: false,
    );
  }
}

// Stateful layer as there is a change in data
class CounterHome extends StatefulWidget {
  const CounterHome({super.key});

  // This State class captures the present state of the app
  @override
  State<CounterHome> createState() => _CounterHomeState();
}

// This class is used to redraw/rerun the engine to design the new state
// This actions are captured in the setState method
class _CounterHomeState extends State<CounterHome> {

  // Create variable
  int counter = 0;

  // Write function to increment and decrement the counter

  void add() {
    setState(() {
      counter++;
    });
  }

  void minus() {
    setState(() {
      counter--;
    });  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Demo'),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: add,
                child: Text("+")),
            SizedBox(height: 10,),
            Text('${counter}'),
            ElevatedButton(
                onPressed: minus,
                child: Text("-")),
          ],
        ),
      ),
    );
  }
}

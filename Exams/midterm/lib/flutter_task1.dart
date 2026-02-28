import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Dashboard()
        }
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> products = [
    {
      "name": "Deshi Mango",
      "price": 300.0,
      "amount": 1
    },
    {
      "name": "Broccoli",
      "price": 450.0,
      "amount": 5
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Card(
                child: Text("Vegetables"),
              ), 
              SizedBox(width: 5,),
              Card(
                child: Text("Fruits"),
              ),
              SizedBox(width: 5,),
              Card(
                child: Text("Masala"),
              ),
              SizedBox(height: 10,),
              Padding(
                  padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(children: [
                      Image.asset("assets/mango.jpg"),
                      Text("\$300.0"),
                      Text("Deshi Mango"),
                      Text("1Kg"),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("-")),
                          Text(""),
                          ElevatedButton(onPressed: () {}, child: Text("+"))
                        ],
                      )
                    ],),
                    Column(children: [
                      Image.asset("assets/broccoli.jpg"),
                      Text("\$300.0"),
                      Text("Deshi Mango"),
                      Text("1Kg"),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("-")),
                          Text(""),
                          ElevatedButton(onPressed: () {}, child: Text("+"))
                        ],
                      )
                    ])
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Column(
                children: [
                  Text("\$300.0"),
                  Text("Cabbage"),
                  Text("1Kg"),
                ],
              )
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}

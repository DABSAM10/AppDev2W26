import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatelessWidget {
  TextEditingController username = TextEditingController();

  // const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/store.jpg",
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Text("Welcome to Book Store"),
            TextField(
              controller: username,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.login),
                labelText: "Enter your name",
                labelStyle: TextStyle(
                  color: Colors.red
                )
              )
            ),
            SizedBox(height: 40,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second', arguments: username.text);
                },
                child: Text(
                  "Visit",
                  style: TextStyle(fontSize: 24, color: Colors.lightGreen),
                )
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  final List<Map<String, dynamic>> books = [
    {
      "title": "Harry Potter and the Philosopher's Stone",
      "price": 15.0,
      "image": "asset/book1.jpg",
      "description": "It follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday when he receives a letter of acceptance from Hogwarts School."
    },
    { "title": "The Great Gatsby",
      "price": 9.98,
      "image": "asset/book2.jpg",
      "description": "Set on the prosperous Long Island of 1922, The Great Gatsby provides a critical social history of Prohibition-era America during the Jazz Age."
    },
    { "title": "Dracula",
      "price": 17.99,
      "image": "asset/book3.jpg",
      "description": "Jonathan Harker, a newly qualified English solicitor, visits Count Dracula at his castle in the Carpathian Mountains to help the Count purchase a house near London. Ignoring the Count's warning, Harker wanders the castle at night and encounters three vampire women; Dracula rescues Harker, and gives the women a small child bound inside a bag. Six weeks later, Dracula leaves the castle, abandoning Harker to the women. Harker, having realized Dracula's real nature, escapes and ends up delirious in a Budapest hospital. "
    },
  ];

  @override Widget build(BuildContext context) {
    final String username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                username, style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search here",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15,),
              SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        var book = books[index];
                        return Card(
                          child: ListTile(
                            leading: Image.asset(book["image"], width: 60),
                            title: Text(book["title"]),
                            subtitle: Text("Price: \$${book["price"]}"),
                            onTap: () {
                              Navigator.pushNamed(context, '/third', arguments: { "username": username, "book": book,},
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int qty = 1;

  void add() {
    setState(() {
      qty++;
    });
  }

  void reduce() {
    if (qty > 1) {
      setState(() {
        qty--;
      });
    }
  }

  @override Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String username = data["username"];
    final Map book = data["book"];
    double totalPrice = book["price"] * qty;

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                username, style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                  book["image"],
                  height: 200),
              SizedBox(height: 10),
              Text(
                book["title"],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Price: \$$totalPrice",
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: reduce,
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                      "$qty",
                      style: TextStyle(fontSize: 20)),
                  IconButton(
                    onPressed: add,
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed( context, '/fourth', arguments: { "username": username, "total": totalPrice,},
                  );
                },
                child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "About this Item",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: Text(
                  book["description"],
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String username = data["username"];
    final double total = data["total"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Store"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                username, style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
          children: [
            Text(
              "Pay using \$ $total",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar( content: Text( "Thanks for the payment of 5 dollars, your request has been processed",),),
                  );
                  },
                child: Text("Paytm"),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your payment has been processed.")));
                },
                child: Text("Credit/Debit"),
              ),
            ),
            SizedBox(height: 20,),

            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your payment has been processed.")));
                },
                child: Text("GooglePay"),
              ),
            ),
            SizedBox(height: 100,),

            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second', arguments: username,);
                },
                child: Text(
                  "Home",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
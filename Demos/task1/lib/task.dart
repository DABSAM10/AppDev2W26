import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Interactive(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Interactive extends StatefulWidget {
  const Interactive({super.key});

  @override
  State<Interactive> createState() => _InteractiveState();
}

class _InteractiveState extends State<Interactive> {
  int counter = 0;

  void minus() {
    setState(() {
      counter--;
    });
  }

  void add() {
    setState(() {
      counter++;
    });
  }

  // void message() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Successfully added to the cart :)'),
  //       duration: Duration(seconds: 5),
  //       )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/strawberry.jpg",
              width: 450,
              fit: BoxFit.cover,),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Strawberries',
                          style: TextStyle(
                            fontSize: 40,
                          )
                      ),
                      SizedBox(height: 2,),
                      Text(
                        '1Kg',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: minus,
                          child: Text('-')
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '${counter}', 
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 10,),
                      ElevatedButton(
                          onPressed: add,
                          child: Text('+')
                      )
                    ],
                  ),
                  SizedBox(width: 120,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${counter * 1.5}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold)
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Description',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('The strawberry (Fragaria × ananassa) is a widely '
                      'cultivated, heart-shaped, bright red, aggregate accessory fruit '
                      'known for its sweet, juicy, and aromatic, pulp. Botanically, '
                      'it is not a true berry but rather a swollen receptacle dotted with '
                      'small, dry, yellow seeds called achenes. It is a highly nutritious, '
                      'nutrient-dense, and popular fruit used fresh, in desserts, or as jams. ',
                    style: TextStyle(fontSize: 16),
                    softWrap: true,
                  )
                ],
              ),
            ),
            SizedBox(height: 100,),
            Padding(
                padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () { // Anonymous function
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Successfully added to the cart :)'),
                          duration: Duration(seconds: 5),
                        )
                    );
                  },
                      child: Text('Add to cart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                    // style: ButtonStyle(
                    //   backgroundColor: WidgetStatePropertyAll(Colors.yellow)
                    // ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

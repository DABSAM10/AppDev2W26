import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Create a reference for multiple routes
      initialRoute: '/', // Start with dashboard/landing page
      routes: { // Refer to all the different routes
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatelessWidget {
  final List<String> items = ['IOS', 'Android', 'Windows', 'MacOS', 'Linux', 'Unix'];

  // const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  // Use NavigatorPushed to refer the named routes
                  Navigator.pushNamed(context, '/second', arguments: items); // 'Named Routing Data'
                },
                child: Text('Click'))
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute is the class that uses to fetch the data from called class
    // settings method is used to accept the data
    // ? in ModalRoute.of(context)? to say that the value could be null
    // the String? is to deal with nullable variable and to type cast at the end

    // final String? data = ModalRoute.of(context)?.settings.arguments as String?;
    final List<String>? items = ModalRoute.of(context)?.settings.arguments as List<String>?; // ?? []
    return Scaffold(
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text(
      //           'Second Page',
      //           style: TextStyle(fontSize: 24),
      //       ),
      //       SizedBox(height: 10,),
      //       Text('$data'),
    // ],
    // ),
    // ),
            body: ListView.builder(
                itemCount: items?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items![index]),
                  );
                }
            )
    );
  }
}
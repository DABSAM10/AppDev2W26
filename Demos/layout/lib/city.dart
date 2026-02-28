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
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cities around world',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
          body: Center(
            child: listView(),
        )
      )
    );
  }



  listView() {
    return ListView(
      children: [
        Card(
          child: cityTile(Image.asset('assets/new york.jpg', width: 90), 'New York', 'United States', 'Population: 8.1 millions'),
        ),
        Card(
          child: cityTile(Image.asset('assets/london.jpg', width: 90), 'London', 'United Kingdom', 'Population: 8 millions'),
        ),
        Card(
          child: cityTile(Image.asset('assets/toronto.jpg', width: 90), 'Toronto', 'Canada', 'Population: 3.2 millions'),
        ),
        Card(
          child: cityTile(Image.asset('assets/sydney.jpg', width: 90), 'Sydney', 'Australia', 'Population: 4.9 millions'),
        )
      ],
    );
  }

  cityTile(Image cityImage, String cityName, String country, String population) {
    return ListTile(
      leading: cityImage,
      title: Text(cityName,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text('$country\n$population'),
    );
  }
}

  // ListView(
  // children: [
  // cityTile(
  // 'assets/new york.jpg',
  // 'New York',
  // 'United States',
  // '8.1 millions'
  // ),
  // Divider(),
  // SizedBox(height: 5
  // ),
  // cityTile(
  // 'assets/london.jpg',
  // 'London',
  // 'United Kingdom',
  // '8 millions'
  // ),
  // Divider(),
  // SizedBox(height: 5
  // ),
  // cityTile(
  // 'assets/toronto.jpg',
  // 'Toronto',
  // 'Canada',
  // '3.2 millions'
  // ),
  // Divider(),
  // SizedBox(height: 5
  // ),
  // cityTile(
  // 'assets/sydney.jpg',
  // 'Sydney',
  // 'Australia',
  // '4.9 millions'
  // ),
  // Divider(),
  // ],
  // )

// cityTile(String image, String city, String country, String population) {
//     return ListTile(
//       leading: Image.asset(image, width: 90, fit: BoxFit.cover,),
//       title: Text(city, style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//       subtitle: Text('$country\nPopulation: $population'),
//       // isThreeLine: true,
//     );
//   }
// }

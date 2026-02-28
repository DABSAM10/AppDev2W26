import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomeBar extends StatelessWidget {
  const MyHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('asset/camping.jpg',
            fit: BoxFit.cover,),
            SizedBox(height: 10,),
            // Title + rating
            Padding(
              // Space that uses to control the widget alignment
                padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.red,),
                    SizedBox(width: 4,),
                    Text('41')
                  ],
                )
              ],
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.call, color: Colors.blue,
                    ),
                    SizedBox(height: 4,),
                    Text('CALL', style: TextStyle(color: Colors.blue),)
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.navigation, color: Colors.blue,
                    ),
                    SizedBox(height: 4,),
                    Text('ROUTE',  style: TextStyle(color: Colors.blue),)
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share, color: Colors.blue,
                    ),
                    SizedBox(height: 4,),
                    Text('SHARE', style: TextStyle(color: Colors.blue),)
                  ],
                ),
              ],
            ),
            ),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(16),
            child: Text(
              'Oeschinen Lake (German: Oeschinensee) is a mountain lake in the Bernese Oberland, Switzerland, '
                  'located above the village of Kandersteg. It lies at an elevation of 1,578 metres (5,177 ft), '
                  'covers 1.115 km² (0.43 sq mi), and reaches a maximum depth of 56 metres (184 ft).'
                  'The lake was formed by prehistoric landslides. Activities here including rowing, and riding the summer toboggan run.',
              style: TextStyle(fontSize: 16, ),
              softWrap: true,
            ),
            )
          ],
        ),
      ),
    );
  }
}

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
        body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
                color: Colors.indigoAccent,
                child: Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card Background',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Cards are surfaces that display content and actions '
                            'on a single topic',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'LISTEN NOW',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                )
            ),
            SizedBox(height: 15,),
            Row( children: [
              SizedBox(width: 180,
                child: Card(
                  color: Colors.indigo,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today Event Live',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'March 19, 2023',
                              style: TextStyle(
                                color: Colors.white,),
                            ),
                            SizedBox(width: 12,),
                            Icon(Icons.calendar_today)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              SizedBox(
                  width: 180,
                  height: 140,
                  child: Card(
                      color: Colors.indigo,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Call',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 90,),
                                Icon(Icons.call)
                              ],
                            ),
                            SizedBox(height: 18),
                            Text( 'John Smith Tek',
                              style: TextStyle(color: Colors.white,
                              fontSize: 20),
                            ),
                          ],
                        ),
                      )
                  )
              )
            ]
            )
        ]
        )
      ),
    )
    );
  }
}

// ElevatedButton(onPressed: (){},
// child: Text('LISTEN NOW'),
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.indigoAccent,
// foregroundColor: Colors.white
// )
// )

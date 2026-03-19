import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Album.dart';

// create a function using Http to get the data from the restful API
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

  // check the network status, 200 means successful
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to connect the server');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CloudJSON(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CloudJSON extends StatefulWidget {
  const CloudJSON({super.key});

  @override
  State<CloudJSON> createState() => _CloudJSONState();
}

class _CloudJSONState extends State<CloudJSON> {
  late Future<Album> futureAlbum;

  // this state will be executed once we start the main function
  // now futureAlbum get all the data from the cloud
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cloud JSON',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          // FutureBuilder works for asynchronous data
          child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text('User ID : ${snapshot.data!.userId}'),
                      Text('ID : ${snapshot.data!.id}'),
                      Text('Title : ${snapshot.data!.title}'),
                    ],
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
      )

    );
  }
}

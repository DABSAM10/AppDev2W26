import 'package:flutter/material.dart';
import 'package:restfulapi/photo_model.dart';
import 'constants.dart';
import 'photo_model.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyJSON())
    ;
  }
}

class MyJSON extends StatefulWidget {
  const MyJSON({super.key});

  @override
  State<MyJSON> createState() => _MyJSONState();
}

class _MyJSONState extends State<MyJSON> {
  late List<PhotoModel>? _photoModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  _getData() async {
    _photoModel = (await ApiService().getPhotos());
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fetch JSON Photos',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: _photoModel == null || _photoModel!.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _photoModel!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_photoModel![index].thumbnailUrl),
              ),
              title: Text(_photoModel![index].title, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Album ID: ${_photoModel![index].albumId}"),
                  Text("ID: ${_photoModel![index].id}"),
                ],
              ),
              trailing: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_photoModel![index].url),
              )
              ),
            );
        },
      )
    );
  }
}

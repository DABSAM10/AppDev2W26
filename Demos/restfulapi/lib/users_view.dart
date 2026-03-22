import 'package:flutter/material.dart';
import 'constants.dart';
import 'user_model.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyJSON());
  }
}

class MyJSON extends StatefulWidget {
  const MyJSON({super.key});

  @override
  State<MyJSON> createState() => _MyJSONState();
}

class _MyJSONState extends State<MyJSON> {
  // Create a container to store all the JSON Data
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers());
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch JSON Users'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.cyanAccent,
        body: _userModel == null || _userModel!.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_userModel![index].id.toString()),
                          SizedBox(height: 10,),
                          Text(_userModel![index].username)
                        ],
                      ),
                      title: Text(
                        _userModel![index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Email: ${_userModel![index].email}'),
                            Text('Company: ${_userModel![index].company.name}'),
                            Text('Website: ${_userModel![index].website}'),
                          ]
                      ),
                      trailing: Column(
                        children: [
                          Text('Street: ${_userModel![index].address.street}'),
                          Text('Zip Code: ${_userModel![index].address.zipcode}'),
                        ],
                      ),
                    )
                  );
                }
            )
    );
  }
}

// Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(_userModel![index].id.toString()),
// Text(_userModel![index].username)
// ],
// ),
// SizedBox(height: 10,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(_userModel![index].email),
// Text(_userModel![index].company.name),
// Text(_userModel![index].website),
// Text(_userModel![index].address.street),
// Text(_userModel![index].address.zipcode),
// ],
// ),
// ],
// ),
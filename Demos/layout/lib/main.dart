import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _buildGrid(),
          // child: _buildListView(),
          // child: _buildStack(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  _buildGrid() =>
      GridView.extent(
        maxCrossAxisExtent: 200,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: _buildGridTileList(5),
      );

  List<Container> _buildGridTileList(count) =>
      List.generate(count, (i) =>
          Container(child: Image.asset('assets/pic$i.jpg')));

  _buildListView() {
    return ListView(
      children: [
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
        _tile('CineArts at the NY', 'NY street 45', Icons.theater_comedy),
      ],
    );
  }

  _tile(String s, String t, IconData theater_comedy) {
    return ListTile(
      title: Text(s,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20
      ),),
      subtitle: Text(t),
      leading: Icon(
        theater_comedy, color: Colors.lightBlueAccent,
      ),
    );
  }

  _buildStack() {
    return Stack(
      alignment: const Alignment((0.6), 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/pic0.jpg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45
          ),
          child: const Text(
            'Sunnyside',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}

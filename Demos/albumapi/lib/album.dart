import 'dart:convert';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({required this.userId, required this.id, required this.title});

  // write a function to convert the cloud data to dart object
  // we try to access the class without initializing and it is given by factory
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String);
  }
}
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

Widget _buildImageColumn() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
      children: [
        _buildImageColumn(),
        _buildImageColumn()
      ],
    ),
  );
}
import 'package:api_app/additempage.dart';
import 'package:api_app/homepage.dart';
import 'package:api_app/itemlistpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Mypp());
}

class Mypp extends StatelessWidget {
  const Mypp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemlistPage(),
    );
  }
}

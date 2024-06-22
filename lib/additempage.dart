import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  var namecontroller = TextEditingController();
  var quantitycontroller = TextEditingController();

  postData() async {
    try {
      var response = await http.post(
          Uri.parse("https://node-server-ymb5.onrender.com/items"),
          body: jsonEncode({
            'name': namecontroller.text,
            'quantity': int.parse(quantitycontroller.text)
          }),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: namecontroller,
          ),
          TextField(
            controller: quantitycontroller,
          ),
          ElevatedButton(
              onPressed: () {
                postData();
              },
              child: Text("post data"))
        ],
      ),
    );
  }
}

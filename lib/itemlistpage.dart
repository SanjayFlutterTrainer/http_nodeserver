import 'dart:convert';

import 'package:api_app/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ItemlistPage extends StatefulWidget {
  const ItemlistPage({super.key});

  @override
  State<ItemlistPage> createState() => _ItemlistPageState();
}

class _ItemlistPageState extends State<ItemlistPage> {
  var namecontroller = TextEditingController();
  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  List items = [];
  void getdata() async {
    try {
      var response = await http
          .get(Uri.parse("https://node-server-ymb5.onrender.com/items"));

      List data = jsonDecode(response.body);
      setState(() {
        items = data;
      });
    } catch (e) {
      print(e);
    }
  }

  putData(String id) async {
    try {
      var response = await http
          .put(Uri.parse("https://node-server-ymb5.onrender.com/items/$id"),
              body: jsonEncode({
                'name': namecontroller.text,
              }),
              headers: {'Content-Type': 'application/json'});
    } catch (e) {
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      var response = await http.delete(
        Uri.parse("https://node-server-ymb5.onrender.com/items/$id"),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: items.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // print(users[index]["name"]);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return UserDetails(
                            user: items[index],
                          );
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Text(items[index]["name"]),
                          Text(items[index]["quantity"].toString()),
                          Text(items[index]["_id"].toString()),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: namecontroller,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    putData(items[index]["_id"].toString());
                                  },
                                  child: Text("update data")),
                              ElevatedButton(
                                  onPressed: () {
                                    deleteData(putData(
                                        items[index]["_id"].toString()));
                                  },
                                  child: Text("delete data"))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}

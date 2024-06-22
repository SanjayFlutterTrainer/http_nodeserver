import 'dart:convert';

import 'package:api_app/user_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List users = [];

  void getdata() async {
    try {
      var response = await http
          .get(Uri.parse("https://node-server-ymb5.onrender.com/items"));

      List data = jsonDecode(response.body);
      setState(() {
        users = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: users.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // print(users[index]["name"]);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return UserDetails(
                            user: users[index],
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Column(
                        children: [
                          Text(users[index]["name"]),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}

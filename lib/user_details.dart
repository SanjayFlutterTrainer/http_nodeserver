import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  var user;
  UserDetails({super.key, this.user});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(widget.user['name']),
              Text(widget.user['username']),
              Text(widget.user['email']),
              Text(widget.user['phone']),
              Text(widget.user['website']),
            ],
          ),
        ),
      ),
    );
  }
}

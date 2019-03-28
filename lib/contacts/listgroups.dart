import 'package:carona_prime/contacts/contact_list.dart';
import 'package:flutter/material.dart';

class GroupsList extends StatefulWidget {

  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grupos"),
        backgroundColor: Color(0xFFCC4B22),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ContactList(),
    );

  }
}


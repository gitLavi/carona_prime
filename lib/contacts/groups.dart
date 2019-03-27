import 'package:carona_prime/contacts/contact_list.dart';
import 'package:flutter/material.dart';

class GroupsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
          body: ContactList(),
        );
    return Stack(children: <Widget>[
      _buildBodyBack(),
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Color(0xFFCC4B22),
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Grupos",
                style: TextStyle(fontSize: 30.0),
              ),
              centerTitle: true,
            ),
          ),
        ],
      ),
    ]);
  }
}

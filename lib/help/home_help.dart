import 'package:carona_prime/contacts/contact_list.dart';
import 'package:carona_prime/home/home_page.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
      body:  HomePage(),
    );
    return Stack(
      children: <Widget>[
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
                  "Ajuda",
                  style: TextStyle(fontSize: 30.0),
                ),
                centerTitle: true,
              ),
            )
          ],
        ),

      ],
    );
  }
}
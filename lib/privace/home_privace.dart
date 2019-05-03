import 'package:carona_prime/home/home_page.dart';
import 'package:flutter/material.dart';

class Privace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
      body: HomePage(),
    );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
      ],
    );
  }
}
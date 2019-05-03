import 'package:carona_prime/groups_op/group_list.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Scaffold(
      body: GroupList(),
    );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
      ],
    );
  }
}
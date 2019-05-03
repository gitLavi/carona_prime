import 'package:carona_prime/groups_op/destiny.dart';
import 'package:carona_prime/widgets/map.dart';
import 'package:flutter/material.dart';

class GroupName extends StatefulWidget {

  @override
  _GroupNameState createState() => _GroupNameState();
}


class _GroupNameState extends State<GroupName> {
  final _GroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC4B22),
        title: Text("Novo Grupo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/logo.png")),
                ),
              ),
            ),
            TextField(
              controller: _GroupController,
              decoration: InputDecoration(
                labelText: "Nome do Grupo",
                labelStyle: TextStyle(color: Color(0xFFCC4B22)),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Data da Carona",
                  labelStyle: TextStyle(color: Color(0xFFCC4B22))),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Horário da Carona",
                  labelStyle: TextStyle(color: Color(0xFFCC4B22))),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xFFCC4B22),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Prosseguir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Destiny()),
                  );
                },
              ),
            ],
          )),
    );
  }
}

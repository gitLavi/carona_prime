import 'package:carona_prime/groups_op/destiny.dart';
import 'package:carona_prime/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class GroupName extends StatefulWidget {

  @override
  _GroupNameState createState() => _GroupNameState();
}

bool pressAttention = true;
String status = "caroneiro";


class _GroupNameState extends State<GroupName> {
  final _GroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final caroneiro = RaisedButton(
      disabledColor: Colors.white10,
      splashColor: Colors.white10,
      highlightColor: Colors.white10,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300)),
      color: Colors.white10,
      child: Icon(
          Icons.directions_walk,
          size: 80,
          color: pressAttention ? Colors.black26 : Color(0xFFCC4B22)
      ),
      onPressed: () {
        status = "caroneiro";
        setState(() {
          if(pressAttention){
            pressAttention = !pressAttention;
          }
        });
      },
    );

    final motorista = RaisedButton(
      disabledColor: Colors.white10,
      splashColor: Colors.white10,
      highlightColor: Colors.white10,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(300)),
      color: Colors.white10,
      child: Icon(
          Icons.directions_car,
          size: 80,
          color: pressAttention ? Color(0xFFCC4B22) : Colors.black26
      ),
      onPressed: () {
        status = "motorista";
        setState(() {
          if(!pressAttention){
            pressAttention = !pressAttention;
          }
        });
      },
    );

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                caroneiro,
                motorista
              ],
            )

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

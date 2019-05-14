import 'package:flutter/material.dart';

class CarEspec extends StatefulWidget {
  @override
  _CarEspecState createState() => _CarEspecState();
}

class _CarEspecState extends State<CarEspec> {

  final _CarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCC4B22),
          title:
              Text("Especificações do Carro", style: TextStyle(fontSize: 28.0)),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _CarController,
                decoration: InputDecoration(
                  labelText: "Número de Vagas",
                  labelStyle: TextStyle(color: Color(0xFFCC4B22)),
                ),
                keyboardType: TextInputType.phone,
              ),


            ],
          ),
        ));
  }
}

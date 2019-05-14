import 'package:flutter/material.dart';

class CarEspec extends StatefulWidget {
  @override
  _CarEspecState createState() => _CarEspecState();
}

class _CarEspecState extends State<CarEspec> {
  bool val = false;

  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Text(
                
                "Por favor, como motorista, informe as suas especificações de seu carro em relação a carona.",
                style: TextStyle(fontSize: 20.0, color: Colors.black, ),
              ),
            ),
            TextFormField(
              controller: _CarController,
              decoration: InputDecoration(
                labelText: "Número de Vagas",
                labelStyle: TextStyle(color: Color(0xFFCC4B22), fontSize: 20.0),
              ),
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Text(
                "Disponibilidade do Porta-malas",
                style: TextStyle(fontSize: 20.0, color: Color(0xFFCC4B22)),
              ),
            ),
            Switch(
                activeColor: Color(0xFFCC4B22),
                value: val,
                onChanged: (newVal) {
                  onSwitchValueChanged(newVal);
                }),
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

                },
              ),
            ],
          )),
    );
  }
}

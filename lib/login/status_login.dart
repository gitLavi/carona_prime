import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:carona_prime/home/home_page.dart';
import 'package:flutter/material.dart';

class StatusLogin extends StatefulWidget {
  @override
  _StatusLoginState createState() => _StatusLoginState();
}

bool pressAttention = true;
String status = "caroneiro";

class _StatusLoginState extends State<StatusLogin> {

  ContactHelper helper = ContactHelper();

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
      appBar: new AppBar(
        title: new Text('Carona Prime')
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
                  fontSize: 20.0 ,
                ),
              ),
              onPressed: () async {

                helper.setStatusFb("65992740046", status);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> HomePage())
                );
              },
            ),
          ],
        )
      ),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          caroneiro,
          motorista
        ],
      )
    );
  }
}
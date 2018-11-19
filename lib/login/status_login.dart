import 'package:carona_prime/home/home_page.dart';
import 'package:flutter/material.dart';

class StatusLogin extends StatefulWidget {
  @override
  _StatusLoginState createState() => _StatusLoginState();
}

bool pressAttention = true;
String status;

class _StatusLoginState extends State<StatusLogin> {
  @override
  Widget build(BuildContext context) {

    final caroneiro = Container(
      height: 80.0,
      width: 120.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: new IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: Icon(
              Icons.directions_walk,
              color: pressAttention ? Colors.black26 : Color(0xFFCC4B22),
              size: 80.0,
            ),
            onPressed: () {
              status = 'Caroneiro';
              setState(() {
                if(pressAttention){
                  pressAttention = !pressAttention;
                }  
              });
        },
      ),
            
          ),
          Expanded(
            child: Container(
              height: 80.0,
              width: 90.0,
              padding: EdgeInsets.only(top: 30.0, left: 20.0),
              child: Text(
                "Caroneiro",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
            ),
          )
        ],
      ),
    );

    final motorista = Container(
      height: 80.0,
      width: 120.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: new IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: Icon(
              Icons.directions_car,
              color: pressAttention ? Color(0xFFCC4B22) : Colors.black26,
              size: 80.0,
            ),
            onPressed: () {
              status = 'Motorista';
              setState(() {
                if(!pressAttention){
                  pressAttention = !pressAttention;
                }  
              });
        },
      ),
            
          ),
          Expanded(
            child: Container(
              height: 80.0,
              width: 90.0,
              padding: EdgeInsets.only(top: 30.0, left: 20.0),
              child: Text(
                "Motorista",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
            ),
          )
        ],
      ),
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
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> HomePage())
                );
              },
            ),
          ],
        )
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            caroneiro,
            SizedBox(width: 75.0,),
            motorista
          ],
        ),
      ),
    );
  }
}
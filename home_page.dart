import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF424242),
      //appBar: new AppBar(
      //  title: new Text('Carona Prime')
      //),
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

              },
            ),
          ],
        )
      ),

  }
}

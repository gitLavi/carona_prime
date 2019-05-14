import 'package:carona_prime/login/login_page.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  static String tag = 'login-page';

  @override
  Widget build(BuildContext context) {

    final logo = Container(
      //tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 48.0,
        child: Image.asset('assets/logohd.png'),    
      ),
      width: 180.0,
      height: 180.0,
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
      decoration: new BoxDecoration(
        color: Color(0xFFCC4B22),
        shape: BoxShape.circle,
      ),
    );

    final welcome = Center(
      child: Container(
        child: Text(
          'Bem vindo ao Carona Prime',
          style: TextStyle(
            fontSize: 23.0,
            color: Color(0xFFFFFFFF)
          ),
        ),
      ),
    );

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> LoginPage()),
                );
              },
            ),
          ],
        )
      ),

      body: SingleChildScrollView(
        child: new Center(
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 60.0),
              logo,
              SizedBox(height: 25.0),
              welcome,
            ],
          ),
        ),
      )
    );
  }
}
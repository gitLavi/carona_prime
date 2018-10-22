import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final logo = Container(
      //tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),    
      ),
      width: 100.0,
      height: 100.0,
      padding: const EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );

    final welcome = Center(
      child: Container(
        child: Text(
          'Bem vindo ao Carona Prime',
          style: TextStyle(
            fontSize: 23.0,
          ),
        )
      ),
    );
    

    //User name field
    final username = TextFormField(
      style: TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.text,
      autofocus: false,
      //initialValue: 'Zé Piqueno',
      decoration: InputDecoration(
        hintText: 'Nome de usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0)
        )
      ),
    );
  
    //phone number field
    final phone = TextFormField(
      style: TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: '99999-9999',
      decoration: InputDecoration(
        hintText: 'Celular',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        )
      ),
    );

    //Login button
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.black,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          onPressed: () {
          //  Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.red,
          child: Text('Cadastrar', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Esqueceu a senha?',
        style: TextStyle(color: Colors.black54),
    ),
    onPressed: () {
      //
    },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0,),
            logo,
            SizedBox(height: 30.0,),
            welcome,
            SizedBox(height: 80.0,),
            username,
            SizedBox(height: 10.0,),
            phone,
            SizedBox(height: 10.0,),
            loginButton,
            forgotLabel,
            SizedBox(height: 35.0,),
          ],
        )
      )
    );
  }
}
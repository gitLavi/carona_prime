import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {


    //logo CARONA PRIME
    final logo = Container(
      //tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 48.0,
        child: Image.asset('assets/logohd.png'),    
      ),
      width: 130.0,
      height: 130.0,
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
      decoration: new BoxDecoration(
        color: Color(0xFFCC4B22),
        shape: BoxShape.circle,
      ),
    );


    //Mensagem de login
    final message = Center(
      child: Container(
        child: Text(
          'Informe seu nome e o número de telefone',
          style: TextStyle(
            fontSize: 23.0,
          ),
        )
      ),
    );
    

    //Campo de nome de usuário
    final username = TextFormField(
      style: TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nome de usuario',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0)
        )
      ),
    );
  
    //Campo de telefone
    final phone = TextFormField(
      style: TextStyle(fontSize: 20.0, color: Colors.black),
      keyboardType: TextInputType.phone,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Celular',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        )
      ),
    );

    //Botão de login
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
          color: Color(0xFFCC4B22),
          child: Text('Cadastrar', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );


    //Não definido
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
      appBar: AppBar(
        title: Text('Carona Prime')
      ),
      body: Center(
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 25.0,),
            logo,
            SizedBox(height: 30.0,),
            message,
            SizedBox(height: 40.0,),
            username,
            SizedBox(height: 10.0,),
            phone,
            SizedBox(height: 10.0,),
            loginButton,
            forgotLabel,
            SizedBox(height: 20.0,),
          ],
        )
      )
    );
  }
}
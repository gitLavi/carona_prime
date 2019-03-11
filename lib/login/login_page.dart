import 'package:carona_prime/contacts/contact_helper.dart';
import 'package:carona_prime/login/status_login.dart';
import 'package:flutter/material.dart';

String userName;
String phoneNumber;

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

final phoneController = new TextEditingController();
final userController = new TextEditingController();

class _LoginPageState extends State<LoginPage> {
  ContactHelper helper = ContactHelper();

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
          'Informe seu número de telefone',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23.0,
          ),
        )
      ),
    );
    

    //Campo de nome de usuário
    final username = TextFormField(
      controller: userController,
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
      controller: phoneController,
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
          onPressed: () async {            
            bool check = false;
            check = await helper.checkContactFb(phoneController.text);
            if (check) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> StatusLogin()));
            }else{
              helper.createContactFb(phoneController.text);
            }
            

            userName = (userController.text);
            phoneNumber = (phoneController.text);
    
          },
          color: Color(0xFFCC4B22),
          child: Text('Entrar', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        ),
      ),
    );


    //Não definido
    final forgotLabel = FlatButton(
      child: Text(
        'Para que servem esses dados?',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          ),
          logo,
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          ),
          message,
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          ),
          //username,
          phone,
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          ),
          loginButton,
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          ),
          forgotLabel,
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 0,
              height: 0,
            ),
          )
        ],
      )
    );
  }
}
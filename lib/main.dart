import 'package:carona_prime/login/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaronaPrime',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Color(0xFFCC4B22)

      ),
      home: WelcomePage()
    );
  }
}
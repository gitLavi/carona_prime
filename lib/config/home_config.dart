import 'package:carona_prime/home/home_page.dart';
import 'package:flutter/material.dart';

class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() =>  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30),
         Padding(
           padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
           child:  RaisedButton(
             onPressed: () {},
             textColor: Colors.white,
             padding: const EdgeInsets.all(0.0),
             child: Container(
               color: Color(0xFFCC4B22),
               padding: const EdgeInsets.all(10.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Icon(Icons.settings, size: 30,),
                   const Text(
                       '   Gerais   ',
                       style: TextStyle(fontSize: 30)
                   ),
                 ],
               ),
             ),
           ),
         ),
          Padding(
            padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
          child:
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              color: Color(0xFFCC4B22),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.lock, size: 30,),
                  const Text(
                      '   Privacidade   ',
                      style: TextStyle(fontSize: 30)
                  ),
                ],
              ),
            ),
          ),)
        ],
      ),
    );
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
      ],
    );
  }
}
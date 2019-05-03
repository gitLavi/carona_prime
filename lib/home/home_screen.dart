import 'package:carona_prime/about/home_about.dart';
import 'package:carona_prime/config/home_config.dart';
import 'package:carona_prime/contacts/contact_list.dart';
import 'package:carona_prime/groups_op/group_list.dart';
import 'package:carona_prime/groups_op/group_name.dart';
import 'package:carona_prime/help/home_help.dart';
import 'package:carona_prime/privace/home_privace.dart';
import 'package:carona_prime/terms/home_terms.dart';
import 'package:carona_prime/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {



    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Grupos", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: ContactList(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Configurações", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: Config(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Termos de Uso", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: Terms(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Políticas de Privacidade", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: Privace(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Ajuda", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: Help(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Sobre", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: About(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Testes", style: TextStyle(fontSize: 30.0)),
            backgroundColor: Color(0xFFCC4B22),
            centerTitle: true,
          ),
          body: GroupName(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

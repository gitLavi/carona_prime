import 'package:carona_prime/about/home_about.dart';
import 'package:carona_prime/config/home_config.dart';
import 'package:carona_prime/contacts/listgroups.dart';
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
          body: Config(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: GroupsList(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: Terms(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: Privace(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: Help(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: About(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}

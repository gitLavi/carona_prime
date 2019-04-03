import 'package:carona_prime/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      color: Colors.white,
    );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildBodyBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 0.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Carona\nPrime",
                        style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Nome do Usuario",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.settings, "Configurações", pageController, 0),
              DrawerTile(Icons.people, "Meus Grupos", pageController, 1),
              DrawerTile(Icons.insert_drive_file, "Termos de Uso", pageController, 2),
              DrawerTile(Icons.lock, "Política de Privacidade", pageController, 3),
              DrawerTile(Icons.help, "Ajuda", pageController, 4),
              DrawerTile(Icons.info, "Sobre", pageController, 5),
            ],

          )
        ],
      ),
    );
  }
}

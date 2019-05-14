import 'package:carona_prime/groups_op/Car_Espec.dart';
import 'package:carona_prime/login/status_login.dart';
import 'package:carona_prime/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Destiny extends StatefulWidget {
  @override
  _DestinyState createState() => _DestinyState();
}

class _DestinyState extends State<Destiny> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC4B22),
        title: Text("Trajeto", style: TextStyle(fontSize: 30.0)),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
          child: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                options: GoogleMapOptions(
                  cameraPosition: CameraPosition(
                    target: LatLng(-15.608505, -56.063327),
                    zoom: 11.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 1.0, 0.0),
                            labelText: "Partida",
                            labelStyle: TextStyle(
                              color: Color(0xFFCC4B22),
                            )),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 1.0, 0.0),
                            labelText: "Destino",
                            labelStyle: TextStyle(color: Color(0xFFCC4B22))),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0.0, 1.0),
                child:  BottomAppBar(
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
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> CarEspec()),
                            );
                          },
                        ),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

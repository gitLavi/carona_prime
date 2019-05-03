import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCp extends StatefulWidget {
  @override
  _MapCpState createState() => _MapCpState();
}

class _MapCpState extends State<MapCp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(-15.608505, -56.063327);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCC4B22),
          title: Text("Novo Grupo"),
          centerTitle: true,
        ),
        body:
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 1.0),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            options: GoogleMapOptions(
              cameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

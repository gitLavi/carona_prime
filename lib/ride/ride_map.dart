import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class RideMap extends StatefulWidget {
  @override
  _RideMapState createState() => _RideMapState();
}

class _RideMapState extends State<RideMap> {

  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String,double>> locationSubscription;
  Location location = new Location();
  void initState() {
    super.initState();

    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;

    initPlatformState();
    locationSubscription = location.onLocationChanged().listen((Map<String, double> result){
      setState(() {
       currentLocation = result; 
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FlutterMap(
        options: new MapOptions(
          minZoom: 10.0,
          center: cuiaba
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "http://mt.google.com/vt/lyrs=m&x={x}&y={y}&z={z}"
          )
        ],
      ),
    );
  }

  void initPlatformState() async {
    Map<String, double> myLocation;
    try{
      myLocation = await location.getLocation();
      //error="";
    }
  }

}
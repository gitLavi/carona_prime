import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class RideMap extends StatefulWidget {
  @override
  _RideMapState createState() => _RideMapState();
}

var currentLocation = <String, double>{};

var location = new Location();

Future curretLocation = location.getLocation();
  

class _RideMapState extends State<RideMap> {
  @override
  LatLng cuiaba = new LatLng(currentLocation["latitude"], currentLocation["longitude"]);

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
}
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class RideMap extends StatefulWidget {
  @override
  _RideMapState createState() => _RideMapState();
}

class _RideMapState extends State<RideMap> {
  @override

  LatLng cuiaba = new LatLng(-15.6014, -56.0979);

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
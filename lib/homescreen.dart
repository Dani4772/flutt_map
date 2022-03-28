import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as lating;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late MapController mapController;
 List<Marker> marker=[];
  @override
  void initState() {
    mapController=MapController();
    for (int i = 0; i < 100; i++) {
      marker.add(
        Marker(
          point: lating.LatLng(
              Random().nextInt(90).toDouble(), Random().nextInt(90).toDouble()), // Put Your location here
          builder: (ctx) => Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('map_flutter'),),
      body: FlutterMap(

        mapController: mapController,
        options: MapOptions(
          center: lating.LatLng(30.1575, 71.5249),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/dani4772/ckzmbvbhg002v14o8p31qht2j/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGFuaTQ3NzIiLCJhIjoiY2t6bWJsaXJwMGh1eDMzbGE4eWkyejlzbiJ9.PfE-FfGKmMyPmG0yroA3Ow",
            additionalOptions: {
              'accessToken': 'pk.eyJ1IjoiZGFuaTQ3NzIiLCJhIjoiY2t6bWJsaXJwMGh1eDMzbGE4eWkyejlzbiJ9.PfE-FfGKmMyPmG0yroA3Ow',
              'id': 'mapbox.mapbox-streets-v8'
            },
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
           ),
          MarkerLayerOptions(
            markers: marker
          ),
        ],
      ),
    );
  }
}

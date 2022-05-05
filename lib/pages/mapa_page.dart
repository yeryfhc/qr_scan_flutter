import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qr_reader/provider/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;
    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      bearing: 10,
      zoom: 18,
    );
    // marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
        markerId: const MarkerId('geo-location'), position: scan.getLatLng()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Location'),
      ),
      body: GoogleMap(
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

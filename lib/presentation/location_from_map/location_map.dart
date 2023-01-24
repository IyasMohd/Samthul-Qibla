import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatelessWidget {
  LocationMap({Key? key}) : super(key: key);

  ValueNotifier<CameraPosition> currentPosition = ValueNotifier(_kGooglePlex);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Marker market = const Marker(
    markerId: MarkerId('1'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        onTap: (LatLng latLng) {
          
        },
      ),
    );
  }
}

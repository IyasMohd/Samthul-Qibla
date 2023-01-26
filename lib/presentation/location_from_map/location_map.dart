import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';

class LocationMap extends StatelessWidget {
  const LocationMap({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Marker marker = const Marker(
    markerId: MarkerId('1'),
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: selectedPosition,
            builder: ((context, value, _) {
              return GoogleMap(
                initialCameraPosition: _kGooglePlex,
                markers: {
                  Marker(
                    markerId: const MarkerId('Id-1'),
                    position: value,
                    icon: BitmapDescriptor.defaultMarker,
                    draggable: true,
                  )
                },
                onTap: (LatLng latLng) {
                  selectedPosition.value = latLng;
                  BlocProvider.of<LocationMapBloc>(context)
                      .add(const LocationMapEvent.getSamthFromMap());
                },
              );
            }),
          ),
          BlocBuilder<LocationMapBloc, LocationMapState>(
            builder: (context, state) {
              return Positioned(
                  right: 20,
                  bottom: 10,
                  left: 20,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.isError
                            ? const Center(child: Text('An Error Occured'))
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Latitude :${state.value.latittude}'),
                                  Text('Longitude :${state.value.longitude}'),
                                  Text(
                                    state.value.samthulQibla,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                  ));
            },
          )
        ],
      ),
    );
  }
}

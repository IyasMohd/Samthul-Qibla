import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationMap extends StatelessWidget {
  LocationMap({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Marker marker = const Marker(
    markerId: MarkerId('1'),
  );

  ValueNotifier<bool> isDrawerOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationMapBloc>(context)
        .add(const LocationMapEvent.refreshUI());
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text(
          'QIBLA DIRECTION',
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info_outline_rounded,
              // size: 26,
              // color: Colors.black,
            ),
          )
        ],
      ),
      body: SlidingUpPanel(
        backdropEnabled: true,
        boxShadow: const <BoxShadow>[
          BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.05))
        ],
        onPanelOpened: () {
          isDrawerOpen.value = true;
        },
        onPanelClosed: () {
          isDrawerOpen.value = false;
        },
        minHeight: 75,
        maxHeight: 400,
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
                  mapToolbarEnabled: false,
                  onTap: (LatLng latLng) {
                    selectedPosition.value = latLng;
                    BlocProvider.of<LocationMapBloc>(context)
                        .add(const LocationMapEvent.getSamthFromMap());
                    // showResult(context);
                  },
                );
              }),
            ),
          ],
        ),
        // header:
        color: Colors.transparent,
        panel: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BlocBuilder<LocationMapBloc, LocationMapState>(
              builder: (context, state) {
            return Wrap(
              children: [
                Column(
                  children: [
                    Container(
                      height: 5,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ValueListenableBuilder(
                        valueListenable: isDrawerOpen,
                        builder: (context, value, _) {
                          return Container(
                              width: double.infinity,
                              height: 400,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                color: darkblue,
                              ),
                              child: !state.isLocationSelected
                                  ? isDrawerOpen.value
                                      ? Center(
                                          child: Text(
                                            "Select a location from Map",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: lightblue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Text(
                                            "Select a location from Map",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                color: lightblue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                  : state.isLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : state.isError
                                          ? Center(
                                              child: Text(
                                              'An Error Occured',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: lightblue,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ))
                                          : Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 30),
                                                  child: Text(
                                                    state.address.address,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: lightblue,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_sharp,
                                                      color: lightblue,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Latitude :     ${state.value.latittude}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: lightblue,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_sharp,
                                                      color: lightblue,
                                                      size: 20,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Longitude :     ${state.value.longitude}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: lightblue,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 40,
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      'QIBLA DIRECTION',
                                                      style: TextStyle(
                                                        color: lightblue,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      state.value.samthulQibla,
                                                      style: const TextStyle(
                                                          color: lightblue,
                                                          fontSize: 45,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      state.value.direction,
                                                      style: const TextStyle(
                                                          color: lightblue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ));
                        }),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

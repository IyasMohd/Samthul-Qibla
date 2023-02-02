import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map_functions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// import 'package:slidi';
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
        backgroundColor: backGround,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'QIBLA DIRECTION',
          style: GoogleFonts.poppins(
            color: Colors.black,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        toolbarHeight: 70,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info_outline_rounded,
              size: 26,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SlidingUpPanel(
        boxShadow: const <BoxShadow>[
          BoxShadow(blurRadius: 8.0, color: Color.fromRGBO(0, 0, 0, 0.15))
        ],
        header: Padding(
          padding: const EdgeInsets.only(left: 190, bottom: 10),
          child: Container(
            height: 5,
            width: 40,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
        ),
        minHeight: 75,
        maxHeight: 346,
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
        color: Colors.transparent,
        panel: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(16.0),
              //   topRight: Radius.circular(16.0),
              // ),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: (56 * 6).toDouble(),
                  child: BlocBuilder<LocationMapBloc, LocationMapState>(
                      builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: darkblue,
                      ),
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state.isError
                              ? const Center(child: Text('An Error Occured'))
                              : Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Text(
                                        state.address.address,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: backGround,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
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
                                          color: backGround,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Latitude :     ${state.value.latittude}",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: backGround,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
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
                                          color: backGround,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Longitude :     ${state.value.longitude}",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: backGround,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
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
                                            color: backGround,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          state.value.samthulQibla,
                                          style: const TextStyle(
                                              color: backGround,
                                              fontSize: 45,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          state.value.direction,
                                          style: const TextStyle(
                                              color: backGround,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

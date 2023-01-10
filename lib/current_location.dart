import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/functions_current_location.dart';
import 'package:samthul_qibla/functions_manual.dart';
import 'package:samthul_qibla/manual_location.dart';

String result = 'سمت القبلة';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String lattitude = '';
  String longitude = '';

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    initialCurrentLocation();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Samthul Qibla'),
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("lib/assets/images/kaaba.jpg"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Container(
            child: isLoading
                ? const Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                        strokeWidth: 5,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ValueListenableBuilder(
                          valueListenable: addressNotifier,
                          builder: ((context, value, child) {
                            return Text(
                              addressNotifier.value,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50, bottom: 0.5, left: 25),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              color: Colors.red,
                            ),
                            Text(
                              'Lattitude',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ValueListenableBuilder(
                        valueListenable: latitudeNotifier,
                        builder: ((context, value, child) {
                          return Text(
                            latitudeNotifier.value,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 60, bottom: 0.5, left: 25),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              color: Colors.red,
                            ),
                            Text(
                              'Longitude',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ValueListenableBuilder(
                        valueListenable: longitudeNotifier,
                        builder: ((context, value, child) {
                          return Text(
                            longitudeNotifier.value,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.white.withOpacity(0.5),
                      //         fixedSize: const Size(400, 50),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(30))),
                      //     onPressed: () async {
                      //       final currentLocation = await _getCurrentLocation();
                      //       final thoolulbalad =
                      //           convertNegativeintoPositive(currentLocation.latitude);

                      //       final aralulBalad = convertNegativeintoPositive(
                      //           currentLocation.longitude);
                      //       const araluMakka = 21.41666667;
                      //       final thoolDirectionEast =
                      //           thoolAralDirection(thoolulbalad);
                      //       final aralDirectionNorth =
                      //           thoolAralDirection(aralulBalad);
                      //       final qausuSsamth = samthulQibla(aralulBalad, araluMakka,
                      //           thoolulbalad, thoolDirectionEast, aralDirectionNorth);
                      //       final qausuSsamthConverted =
                      //           convertDecimalTolatlong(qausuSsamth);
                      //       setState(() {
                      //         result = qausuSsamthConverted;
                      //       });
                      //     },
                      //     child: Text(
                      //       'Get Samth',
                      //       style: GoogleFonts.poppins(
                      //           textStyle: const TextStyle(color: Colors.black)),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: ValueListenableBuilder(
                          valueListenable: resultNotifier,
                          builder: (context, value, child) {
                            return Text(
                              resultNotifier.value,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton.small(
                            heroTag: 1,
                            onPressed: () {},
                            child: const Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton(
                            heroTag: 2,
                            onPressed: () {
                              initialCurrentLocation();
                            },
                            child: const Icon(
                              Icons.location_searching_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton.small(
                            heroTag: 3,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ManualLocation()));
                            },
                            child: const Icon(
                              Icons.navigation_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 40, right: 20),
          //     child: Column(
          //       children: [
          //         FloatingActionButton.small(
          //           onPressed: () {},
          //           child: const Icon(Icons.location_searching_outlined),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         FloatingActionButton.small(
          //           onPressed: () {},
          //           child: const Icon(Icons.location_searching_outlined),
          //         ),
          //         const SizedBox(
          //           height: 20,
          //         ),
          //         FloatingActionButton.small(
          //           onPressed: () {},
          //           child: const Icon(Icons.location_searching_outlined),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

  void initialCurrentLocation() async {
    final currentLocation = await _getCurrentLocation();
    await placemarkFromCoordinates(
      currentLocation.latitude,
      currentLocation.longitude,
    ).then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      final currentAddress =
          '${place.street},${place.subLocality},${place.subAdministrativeArea},${place.postalCode}';
      addressNotifier.value = currentAddress;
      addressNotifier.notifyListeners();
    });

    final aralulBalad = convertNegativeintoPositive(currentLocation.latitude);

    final thoolulBalad = convertNegativeintoPositive(currentLocation.longitude);
    const araluMakka = 21.41666667;
    final longitudeDirectionEast = thoolAralDirection(thoolulBalad);
    final latitudeDirectionNorth = thoolAralDirection(aralulBalad);
    final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulBalad,
        longitudeDirectionEast, latitudeDirectionNorth);
    final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);

    final latitudeConverted =
        convertLatDecimalTolatlong(currentLocation.latitude);
    final longitudeConverted =
        convertLongDecimalTolatlong(currentLocation.longitude);

    // setState(() {
    //   result = qausuSsamthConverted;
    //   isLoading = false;
    //   lattitude = latitudeConverted;
    //   longitude = longitudeConverted;
    // });
    resultNotifier.value = qausuSsamthConverted;
    latitudeNotifier.value = latitudeConverted;
    longitudeNotifier.value = longitudeConverted;
    longitudeNotifier.notifyListeners();
    latitudeNotifier.notifyListeners();
    resultNotifier.notifyListeners();
    setState(() {
      isLoading = false;
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permenently denied');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      timeLimit: const Duration(seconds: 10),
    );
  }
}

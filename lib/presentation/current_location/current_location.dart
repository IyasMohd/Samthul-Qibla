import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/bloc/current_location_bloc.dart';

String result = 'سمت القبلة';

class CurrentLocation extends StatelessWidget {
  CurrentLocation({super.key});

  String lattitude = '';
  String longitude = '';

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // initialCurrentLocation();

    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    //   BlocProvider.of<CurrentLocationBloc>(context)
    //       .add(const CurrentLocationEvent.initialize());
    // });

    BlocProvider.of<CurrentLocationBloc>(context)
        .add(const CurrentLocationEvent.initialize());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Samthul Qibla'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
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
            BlocBuilder<CurrentLocationBloc, CurrentLocationState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.isError
                            ? const Center(child: Text('An Error Occured'))
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Text(
                                      state.value.address,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                                  Text(
                                    state.value.latittude,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                  Text(
                                    state.value.longitude,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 100),
                                    child: Text(
                                      state.value.samthulQibla,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

          
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
        
  

//   void initialCurrentLocation() async {
//     final currentLocation = await _getCurrentLocation();
//     await placemarkFromCoordinates(
//       currentLocation.latitude,
//       currentLocation.longitude,
//     ).then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];

//       final currentAddress =
//           '${place.street},${place.subLocality},${place.subAdministrativeArea},${place.postalCode}';
//       addressNotifier.value = currentAddress;
//       addressNotifier.notifyListeners();
//     });

//     final aralulBalad = convertNegativeintoPositive(currentLocation.latitude);

//     final thoolulBalad = convertNegativeintoPositive(currentLocation.longitude);
//     const araluMakka = 21.41666667;
//     final longitudeDirectionEast = thoolAralDirection(thoolulBalad);
//     final latitudeDirectionNorth = thoolAralDirection(aralulBalad);
//     final qausuSsamth = samthulQibla(aralulBalad, araluMakka, thoolulBalad,
//         longitudeDirectionEast, latitudeDirectionNorth);
//     final qausuSsamthConverted = convertDecimalTolatlong(qausuSsamth);

//     final latitudeConverted =
//         convertLatDecimalTolatlong(currentLocation.latitude);
//     final longitudeConverted =
//         convertLongDecimalTolatlong(currentLocation.longitude);

//     // setState(() {
//     //   result = qausuSsamthConverted;
//     //   isLoading = false;
//     //   lattitude = latitudeConverted;
//     //   longitude = longitudeConverted;
//     // });
//     resultNotifier.value = qausuSsamthConverted;
//     latitudeNotifier.value = latitudeConverted;
//     longitudeNotifier.value = longitudeConverted;
//     longitudeNotifier.notifyListeners();
//     latitudeNotifier.notifyListeners();
//     resultNotifier.notifyListeners();

//   }

//   Future<Position> _getCurrentLocation() async {
//     bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isLocationServiceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     LocationPermission permission = await Geolocator.checkPermission();

//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permenently denied');
//     }
//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.best,
//       timeLimit: const Duration(seconds: 10),
//     );
//   }

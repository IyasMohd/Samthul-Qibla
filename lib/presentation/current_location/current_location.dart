import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/current_location/current_location_bloc.dart';
import 'package:samthul_qibla/core/asset_manager.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/current_location/widgets/appbar_current_location.dart';

class CurrentLocation extends StatelessWidget {
  CurrentLocation({super.key});

  String lattitude = '';
  String longitude = '';

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CurrentLocationBloc>(context)
        .add(const CurrentLocationEvent.initialize());

    return Scaffold(
      backgroundColor: backGround,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<CurrentLocationBloc, CurrentLocationState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetManager.backGroundImage),
                      fit: BoxFit.cover),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    5.verticalSpace,
                    AppBarCurrentLocation(),
                    10.verticalSpace,
                    RefreshIndicator(
                      displacement: 0,
                      edgeOffset: 0,
                      backgroundColor: darkblue,
                      color: Colors.white,
                      onRefresh: () async {
                        return BlocProvider.of<CurrentLocationBloc>(context)
                            .add(const CurrentLocationEvent.initialize());
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 0.5.w,
                            right: 0.5.w,
                            top: 10.h,
                          ),
                          child: state.isLoading
                              ? SizedBox(
                                  height: 400.h,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                                )
                              : state.isError
                                  ? SizedBox(
                                      height: 400.h,
                                      child: Center(
                                        child: Text(
                                          'An Error Occured',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 45.h,
                                              left: 45.w,
                                              right: 45.w,
                                              bottom: 8),
                                          child: Text(
                                            state.value.address,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: backGround,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        33.verticalSpace,
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on_sharp,
                                                color: backGround,
                                                size: 20.sp,
                                              ),
                                              5.horizontalSpace,
                                              Text(
                                                "Latitude :     ${state.value.latittude}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: backGround,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        15.verticalSpace,
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 22.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on_sharp,
                                                color: backGround,
                                                size: 20.sp,
                                              ),
                                              5.horizontalSpace,
                                              Text(
                                                "Longitude :     ${state.value.longitude}",
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: backGround,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        180.verticalSpace,
                                        Text(
                                          'QIBLA DIRECTION',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        15.verticalSpace,
                                        Text(
                                          state.value.samthulQibla,
                                          style: TextStyle(
                                              color: kblack,
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        15.verticalSpace,
                                        Text(
                                          state.value.direction,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Padding(
//                     padding: const EdgeInsets.only(
//                         top: 60, bottom: 0.5, left: 25),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.location_on_sharp,
//                           color: Colors.red,
//                         ),
//                         Text(
//                           'Longitude',
//                           style: GoogleFonts.poppins(
//                             textStyle: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     state.value.longitude,
//                     style: GoogleFonts.poppins(
//                       textStyle: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 100),
//                     child: Text(
//                       state.value.samthulQibla,
//                       overflow: TextOverflow.ellipsis,
//                       style: GoogleFonts.poppins(
//                         textStyle: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//   ),
// );

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

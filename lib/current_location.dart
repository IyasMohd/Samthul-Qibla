import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/functions_current_location.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String result = 'سمت القبلة';

  String lattitude = '';
  String longitude = '';

  
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    'سمت القبلة',
                    style: GoogleFonts.notoKufiArabic(
                      color: Colors.amber,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50, bottom: 0.5, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                Text(lattitude),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 0.5, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                Text(longitude),

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
                  padding: const EdgeInsets.only(top: 150),
                  child: Text(
                    result,
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
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/core/asset_manager.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/current_location/current_location.dart';
import 'package:samthul_qibla/presentation/dash_board/widgets/dashboard_list_container.dart';
import 'package:samthul_qibla/presentation/location_from_map/location_map.dart';
import 'package:samthul_qibla/presentation/main_page/widgets/appbar_main_page.dart';
import 'package:samthul_qibla/presentation/manual_location/manual_location.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const AppBarMainPage(),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => CurrentLocation()),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  size: size,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Icon(
                          Icons.gps_fixed_rounded,
                          color: Colors.black.withOpacity(0.2),
                          size: 160,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(18)),
                          child: Image.asset(
                            AssetManager.compassImage,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Qibla direction from your ',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' Current Location',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) =>  LocationMap()),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  size: size,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.black.withOpacity(0.2),
                          size: 160,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(18)),
                          child: Image.asset(
                            AssetManager.mapImage,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 33, left: 130),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Qibla direction from location which selected from',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Google Map',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => ManualLocation()),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  size: size,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Icon(
                          Icons.gps_fixed_rounded,
                          color: Colors.black.withOpacity(0.2),
                          size: 160,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(18)),
                          child: Image.asset(
                            AssetManager.rubul_mujayyab,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' Qibla direction with ',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' Coordinates',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

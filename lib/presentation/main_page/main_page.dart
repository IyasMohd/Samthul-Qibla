import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      backgroundColor: backGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Column(
            children: [
              2.5.verticalSpace,
              const AppBarMainPage(),
              SizedBox(
                height: 27.h,
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
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        child: Icon(
                          Icons.gps_fixed_rounded,
                          color: Colors.black.withOpacity(0.2),
                          size: 130.sp,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.r)),
                          child: Image.asset(
                            AssetManager.compassImage,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: size.height * 0.045,
                          left: 20.w,
                          right: 120.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' Qibla direction from your ',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' Current Location',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.sp,
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
              8.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => LocationMap()),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.black.withOpacity(0.2),
                          size: 140.sp,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r)),
                          child: Image.asset(
                            AssetManager.mapImage,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: size.height * 0.025,
                          left: 120.w,
                          right: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Qibla direction from location which selected from',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Google Map',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.sp,
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
              8.verticalSpace,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => ManualLocation()),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        child: Icon(
                          Icons.gps_fixed_rounded,
                          color: Colors.black.withOpacity(0.2),
                          size: 130.sp,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.r)),
                          child: Image.asset(
                            AssetManager.rubul_mujayyab,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: size.height * 0.045,
                          left: 20.w,
                          right: 120.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ' Qibla direction with ',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' Coordinates',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.sp,
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

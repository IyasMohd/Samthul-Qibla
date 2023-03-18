import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/core/asset_manager.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/dash_board/widgets/appbar_widget.dart';
import 'package:samthul_qibla/presentation/dash_board/widgets/dashboard_list_container.dart';
import 'package:samthul_qibla/presentation/main_page/main_page.dart';
import 'package:samthul_qibla/presentation/namaz_time/namaz_time.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Column(
            children: [
              2.5.verticalSpace,
              AppBarWidget(
                scaffoldKey: _scaffoldKey,
                title: 'AL BAHJA',
              ),
              SizedBox(
                height: 27.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const MainPage(),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 80.w,
                        bottom: -60.h,
                        child: Image.asset(
                          AssetManager.kaabaIcon,
                          color: Colors.black.withOpacity(0.5),
                          opacity: const AlwaysStoppedAnimation(0.4),
                          width: 250.w,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(18.r)),
                          child: Image.asset(
                            AssetManager.compassImage,
                            scale: 7,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: size.height * 0.025,
                          left: 20.w,
                          right: 120.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Qibla Direction',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            3.verticalSpace,
                            Text(
                              'Obtaining the correct direction of the Qibla from any location worldwide with precision.',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => NamazTime()),
                  ),
                ),
                child: DashBoardListContainer(
                  child: Center(
                    child: Text(
                      'Coming Soon...',
                      style: GoogleFonts.poppins(
                        color: lightblue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: darkblue,
          width: 160,
          child: ListView(children: [
            ListTile(
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: backGround,
                  )),
            ),
            const ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(
              height: 2,
              color: backGround.withOpacity(0.5),
            )
          ]),
        ),
      ),
    );
  }
}

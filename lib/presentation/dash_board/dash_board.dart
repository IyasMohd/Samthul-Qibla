import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/core/asset_manager.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/dash_board/widgets/appbar_widget.dart';
import 'package:samthul_qibla/presentation/dash_board/widgets/dashboard_list_container.dart';
import 'package:samthul_qibla/presentation/main_page/main_page.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGround,
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AppBarWidget(
                scaffoldKey: _scaffoldKey,
                title: 'AL BAHJA',
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => MainPage(),
                    ),
                  );
                },
                child: DashBoardListContainer(
                  size: size,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 2,
                        bottom: -140,
                        child: Image.asset(
                          AssetManager.kaabaIcon,
                          color: Colors.black.withOpacity(0.5),
                          opacity: const AlwaysStoppedAnimation(0.4),
                          width: 370,
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
                        padding: const EdgeInsets.only(top: 25, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Qibla Direction',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Obtaining the correct direction \nof the Qibla from any location \nworldwide with precision.',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
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
              DashBoardListContainer(
                size: size,
                child: Center(
                  child: Text(
                    'Coming Soon...',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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
          width: size.width * 0.5,
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
                'Home',
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

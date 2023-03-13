import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/current_location/current_location_bloc.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/domain/core/di/injectable.dart';
import 'package:samthul_qibla/presentation/dash_board/dash_board.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CurrentLocationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<LocationMapBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ManualLocationBloc>(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Samthul Qibla',
              theme: ThemeData(
                useMaterial3: true,
                // colorSchemeSeed: backGround,
                scaffoldBackgroundColor: backGround,
                canvasColor: Colors.transparent,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    fixedSize: Size(300.w, 50.h),
                  ),
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: backGround,
                  // foregroundColor: Colors.black,
                  iconTheme: IconThemeData(
                    color: kblack,
                  ),
                  actionsIconTheme: IconThemeData(
                    color: kblack,
                  ),
                  elevation: 0,
                  centerTitle: true,
                  titleTextStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                primarySwatch: Colors.blueGrey,
              ),
              home: DashBoard(),
            );
          }),
    );
    // );
  }
}

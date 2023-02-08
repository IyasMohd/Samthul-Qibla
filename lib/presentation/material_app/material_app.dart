import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Samthul Qibla',
          theme: ThemeData(
            useMaterial3: true,
            // colorSchemeSeed: backGround,
            canvasColor: Colors.transparent,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.5),
                fixedSize: const Size(300, 50),
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: backGround,
              // foregroundColor: Colors.black,
              iconTheme: const IconThemeData(
                color: kblack,
              ),
              actionsIconTheme: const IconThemeData(
                color: kblack,
                size: 26,
              ),
              toolbarHeight: 70,
              elevation: 0,
              centerTitle: true,
              titleSpacing: 20,
              titleTextStyle: GoogleFonts.poppins(
                color: Colors.black,
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            primarySwatch: Colors.blueGrey,
          ),
          home: DashBoard()),
    );
    // );
  }
}

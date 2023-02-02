import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/current_location/current_location_bloc.dart';
import 'package:samthul_qibla/application/location_map/location_map_bloc.dart';
import 'package:samthul_qibla/application/manual_location/manual_location_bloc.dart';
import 'package:samthul_qibla/domain/core/di/injectable.dart';
import 'package:samthul_qibla/presentation/dash_board/dash_board.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  // getIt.registerLazySingleton<CurrentLocationService>(() =>CurrentLocationRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
            canvasColor: Colors.transparent,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.5),
                fixedSize: const Size(300, 50),
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                splashColor: Colors.lightBlueAccent),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleSpacing: 20,
              titleTextStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            primarySwatch: Colors.blueGrey,
          ),
          home: DashBoard()),
    );
    // );
  }
}

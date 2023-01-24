import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/application/bloc/current_location_bloc.dart';
import 'package:samthul_qibla/domain/core/di/injectable.dart';
import 'package:samthul_qibla/main_page.dart';

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
    return BlocProvider(
      create: (context) => getIt<CurrentLocationBloc>(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Samthul Qibla',
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.5),
                fixedSize: const Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
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
            primarySwatch: Colors.lightGreen,
          ),
          home: MainPage()),
    );
    // );
  }
}

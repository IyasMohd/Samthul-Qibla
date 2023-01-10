import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/screen_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: const ScreenHome());
  }
}

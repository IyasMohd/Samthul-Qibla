import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/core/colors/colors.dart';

class AppBarCurrentLocation extends StatelessWidget {
  const AppBarCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: backGround,
            size: 25,
          ),
        ),
        Text(
          'QIBLA DIRECTION',
          style: GoogleFonts.poppins(
            color: backGround,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: backGround,
            ))
      ],
    );
  }
}

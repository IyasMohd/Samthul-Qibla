import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarMainPage extends StatelessWidget {
  const AppBarMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),
        Text(
          'QIBLA DIRECTION',
          style: GoogleFonts.poppins(
            color: Colors.black,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
              size: 26,
            ))
      ],
    );
  }
}

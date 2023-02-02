import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.title,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const Icon(
            Icons.sort_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        Text(
          title,
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
              size: 26,
            ))
      ],
    );
  }
}

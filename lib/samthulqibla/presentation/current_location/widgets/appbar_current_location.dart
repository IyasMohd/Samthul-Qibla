import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/presentation/display_worksheet/work_sheet.dart';

class AppBarCurrentLocation extends StatelessWidget {
  const AppBarCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: backGround,
            size: 30.sp,
          ),
        ),
        Text(
          'QIBLA DIRECTION',
          style: GoogleFonts.poppins(
            color: backGround,
            letterSpacing: 3.5.w,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        IconButton(
            tooltip: 'Work Sheet',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const WorkSheet(),
                ),
              );
            },
            icon: const Icon(
              Icons.description_outlined,
              color: backGround,
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarMainPage extends StatelessWidget {
  const AppBarMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
          Text(
            'QIBLA DIRECTION',
            style: GoogleFonts.poppins(
              color: Colors.black,
              letterSpacing: 3.5.w,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 27.sp,
              ))
        ],
      ),
    );
  }
}

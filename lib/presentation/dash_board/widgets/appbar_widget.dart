import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: Icon(
              Icons.sort_rounded,
              color: Colors.black,
              size: 33.sp,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              letterSpacing: 4.w,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.info_outline,
                size: 27.sp,
              ))
        ],
      ),
    );
  }
}

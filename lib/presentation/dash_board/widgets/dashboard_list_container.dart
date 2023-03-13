import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/core/constants.dart';

class DashBoardListContainer extends StatelessWidget {
  const DashBoardListContainer({
    Key? key,
    required this.child,
  }) : super(key: key);


  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h,
      width: 347.w,
      decoration: BoxDecoration(
        color: darkblue,
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0.r,
          ),
        ],
      ),
      child: child,
    );
  }
}

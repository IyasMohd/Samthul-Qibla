import 'package:flutter/material.dart';
import 'package:samthul_qibla/core/colors/colors.dart';
import 'package:samthul_qibla/core/constants.dart';

class DashBoardListContainer extends StatelessWidget {
  const DashBoardListContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.width * 0.35,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: darkblue,
          borderRadius: radius,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: child);
  }
}

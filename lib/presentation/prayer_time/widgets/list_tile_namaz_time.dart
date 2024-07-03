import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samthul_qibla/core/colors/colors.dart';

class ListTileNamazTime extends StatelessWidget {
  final String vaqth;
  final String time;
  void Function()? onTapTile;
  void Function()? onTapIcon;

  ListTileNamazTime({
    Key? key,
    required this.vaqth,
    required this.time,
    required this.onTapIcon,
    required this.onTapTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTapTile,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vaqth,
                style: GoogleFonts.poppins(
                  color: darkblue,
                  fontSize: 17.sp,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: darkblue,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
          trailing: SizedBox(
            width: 64.w,
            child: Row(
              children: [
                VerticalDivider(),
                IconButton(
                    onPressed: onTapIcon,
                    icon: Icon(Icons.notifications_active)),
              ],
            ),
          ),
        ),
        Divider(
          height: 0,
        )
      ],
    );
  }
}

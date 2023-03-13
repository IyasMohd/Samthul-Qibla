import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SamthToggleButtons extends StatefulWidget {
  SamthToggleButtons({
    super.key,
    required this.firstDirection,
    required this.secondDirection,
    required this.boolList,
    required this.notifier,
    required this.focusNodeList,
    required this.focusNodeTo,
    required this.focusNodetoggle,
  });

  final String firstDirection;
  final String secondDirection;

  final List<bool> boolList;

  ValueNotifier<bool> notifier;

  final List<FocusNode> focusNodeList;

  final FocusNode focusNodeTo;

  final FocusNode focusNodetoggle;

  @override
  State<SamthToggleButtons> createState() => _SamthToggleButtonsState();
}

class _SamthToggleButtonsState extends State<SamthToggleButtons> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ToggleButtons(
      focusNodes: widget.focusNodeList,
      direction: Axis.horizontal,
      onPressed: (newIndex) {
        widget.focusNodetoggle.unfocus();
        FocusScope.of(context).requestFocus(widget.focusNodeTo);
        setState(() {
          for (int index = 0; index < widget.boolList.length; index++) {
            // checking for the index value
            if (index == newIndex) {
              // one button is always set to true
              widget.boolList[index] = true;
            } else {
              // other two will be set to false and not selected
              widget.boolList[index] = false;
            }
          }
          if (newIndex == 0) {
            widget.notifier.value = true;
          } else {
            widget.notifier.value = false;
          }
        });
      },
      selectedColor: Colors.white,
      // text color of not selected toggle
      color: Colors.white.withOpacity(0.2),
      // fill color of selected toggle
      fillColor: Colors.white.withOpacity(0.1),
      // when pressed, splash color is seen
      // splashColor: Colors.blue,
      // long press to identify highlight color
      // highlightColor: Colors.orange,
      // if consistency is needed for all text style
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      // border properties for each toggle
      renderBorder: true,
      borderColor: Colors.white.withOpacity(0.1),
      borderWidth: 1,
      // borderRadius: BorderRadius.circular(30),
      selectedBorderColor: Colors.white.withOpacity(0.1),
      isSelected: widget.boolList,
      constraints: BoxConstraints(minHeight: 45.h, minWidth: 37.w),
      children: [
        Text(
          widget.firstDirection,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 20.sp),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.secondDirection,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 20.sp),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

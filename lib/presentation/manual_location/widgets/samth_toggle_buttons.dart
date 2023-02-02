import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SamthToggleButtons extends StatefulWidget {
  SamthToggleButtons({
    super.key,
    required this.firstDirection,
    required this.secondDirection,
    required this.boolList,
    required this.notifier,
  });

  final String firstDirection;
  final String secondDirection;

  final List<bool> boolList;

  ValueNotifier<bool> notifier;

  @override
  State<SamthToggleButtons> createState() => _SamthToggleButtonsState();
}

class _SamthToggleButtonsState extends State<SamthToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (newIndex) {
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
      constraints: const BoxConstraints(minHeight: 54, minWidth: 40),
      children: [
        Text(
          widget.firstDirection,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.secondDirection,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

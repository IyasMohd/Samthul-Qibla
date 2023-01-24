import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SamthToggleButtons extends StatelessWidget {
  const SamthToggleButtons({
    super.key,
    required this.firstDirection,
    required this.secondDirection,
    required this.toggleOnPressed,
    required this.boolList,
  });

  final String firstDirection;
  final String secondDirection;
  final void Function(int? index) toggleOnPressed;

  final List<bool> boolList;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: toggleOnPressed,
      selectedColor: Colors.black87,
      // text color of not selected toggle
      color: Colors.white,
      // fill color of selected toggle
      fillColor: Colors.white.withOpacity(0.5),
      // when pressed, splash color is seen
      // splashColor: Colors.blue,
      // long press to identify highlight color
      // highlightColor: Colors.orange,
      // if consistency is needed for all text style
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      // border properties for each toggle
      renderBorder: true,
      borderColor: Colors.white.withOpacity(0.5),
      borderWidth: 1,
      borderRadius: BorderRadius.circular(30),
      selectedBorderColor: Colors.white.withOpacity(0.5),
      isSelected: boolList,
      constraints: const BoxConstraints(minHeight: 45, minWidth: 40),
      children: [
        Text(
          firstDirection,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          secondDirection,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

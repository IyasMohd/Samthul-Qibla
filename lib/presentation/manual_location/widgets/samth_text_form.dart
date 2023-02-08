import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SamthFormField extends StatelessWidget {
  const SamthFormField({
    Key? key,
    required this.labelText,
    required this.suffixText,
    required this.controller,
    required this.validatorFunction,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.textInputAction,
  }) : super(key: key);

  final FocusNode focusNode;
  final String labelText;
  final String suffixText;
  final TextEditingController controller;
  final String? Function(String?) validatorFunction;
  final TextInputAction textInputAction;

  final void Function(String) onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: validatorFunction,
        textInputAction: textInputAction,
        autofocus: true,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        controller: controller,
        cursorHeight: 20,
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          suffixText: suffixText,
          suffixStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          contentPadding: const EdgeInsets.all(10),
          label: Text(labelText),
          labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.white.withOpacity(0.2),
                fontWeight: FontWeight.bold),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

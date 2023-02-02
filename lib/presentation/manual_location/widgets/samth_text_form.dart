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
  }) : super(key: key);

  final String labelText;
  final String suffixText;
  final TextEditingController controller;
  final String? Function(String?) validatorFunction;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: validatorFunction,
        autofocus: true,
        
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

class SamthTextFormField extends StatelessWidget {
  const SamthTextFormField({
    Key? key,
    required this.hintText,
    required this.suffixText,
    required this.controller,
    required this.validatorFunction,
  }) : super(key: key);

  final String hintText;
  final String suffixText;
  final TextEditingController controller;
  final String? Function(String?) validatorFunction;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        validator: validatorFunction,
        controller: controller,
        cursorHeight: 20,
        cursorColor: Colors.grey.shade800,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixText: suffixText,
          suffixStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(fontWeight: FontWeight.bold)),
          fillColor: Colors.white.withOpacity(0.5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
        ),
      ),
    );
  }
}

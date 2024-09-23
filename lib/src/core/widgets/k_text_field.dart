import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/widgets/outline_input_border.dart';

class KTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obSecureText;
  const KTextField({
    super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.obSecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 18,
        color: kGreyColor,
      ),
      cursorColor: Colors.white,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obSecureText??false,
      decoration: InputDecoration(
          isDense: true,
          fillColor: kFillColor.withOpacity(0.2),
          filled: true,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
          hintStyle: GoogleFonts.poppins(
            color: kGreyColor.withOpacity(0.6),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          border: kOutlineInputBorder(),
          enabledBorder: kOutlineInputBorder(),
          disabledBorder: kOutlineInputBorder(),
          focusedBorder: kOutlineInputBorder(),
          suffixIcon: suffixIcon),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberingContainer extends StatelessWidget {
  const NumberingContainer(
      {super.key, required this.data, required this.selectedColor});
  final int data;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(shape: BoxShape.circle, color: selectedColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
        child: Text(
          (data + 1).toString(),
          style: GoogleFonts.lato(
              fontSize: 18,
              decoration: TextDecoration.none,
              color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAnswerButton extends StatelessWidget {
  const CustomAnswerButton({super.key, required this.onTap, required this.txt});
  final void Function() onTap;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: SizedBox(
          width: 300,
          child: Text(
            txt,
            textAlign: TextAlign.center,
          ),
        ));
  }
}

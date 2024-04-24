import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenPage extends StatefulWidget {
  const StartScreenPage({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  State<StartScreenPage> createState() => _StartScreenPageState();
}

class _StartScreenPageState extends State<StartScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        color: const Color.fromARGB(152, 255, 255, 255),
        width: 300,
      ),
      const SizedBox(
        height: 80,
      ),
      Text(
        'Learn flutter the fun way',
        style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 229, 229, 229),
            fontSize: 24,
            decoration: TextDecoration.none),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 30),
      OutlinedButton.icon(
        onPressed: widget.startQuiz,
        icon: const Icon(
          Icons.arrow_right_alt_sharp,
        ),
        label: const Text(
          'Start Quiz',
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      )
    ]);
  }
}

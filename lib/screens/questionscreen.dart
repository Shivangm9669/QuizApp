import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/questions_and_answers.dart';
import 'package:quizapp/widgets/anserbutton.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.setAnswer});

  final void Function(String answer) setAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuesIndx = 0;

  void answerQuestion(String selectedAnswer) {
    widget.setAnswer(selectedAnswer);

    setState(() {
      currentQuesIndx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuesIndx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.ques,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffled().map((e) => CustomAnswerButton(
                onTap: () {
                  answerQuestion(e);
                },
                txt: e))
          ],
        ),
      ),
    );
  }
}

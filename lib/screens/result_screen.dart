import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/questions_and_answers.dart';
import 'package:quizapp/widgets/resultsummary.dart';

class ResultScreenPage extends StatelessWidget {
  const ResultScreenPage({super.key, required this.chosenAnswer , required this.onRestart});
  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].ques,
        'correct_answer': questions[i].answers[0],
        'choose_answer': chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getSummary().where((data) {
      return data['choose_answer'] == data['correct_answer'];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'You answer $numCorrectQuestions out of $numTotalQuestions is correct well done!',
            style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none)),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ResultSummaryScreen(summaryData: getSummary()),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed: onRestart,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white)),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            label: const Text("Restart Quiz"))
      ],
    );
  }
}

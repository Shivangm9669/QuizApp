import 'package:flutter/material.dart';
import 'package:quizapp/models/questions_and_answers.dart';
import 'package:quizapp/screens/mainscreen.dart';
import 'package:quizapp/screens/questionscreen.dart';
import 'package:quizapp/screens/result_screen.dart';

class QuizAppScreen extends StatefulWidget {
  const QuizAppScreen({super.key});

  @override
  State<QuizAppScreen> createState() => _QuizAppScreenState();
}

class _QuizAppScreenState extends State<QuizAppScreen> {
  List<String> choosedAnswer = [];

  var activeScreen = 'Main_screen';

  void swtichScreen() {
    setState(() {
      activeScreen = 'Question_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      choosedAnswer = [];
      activeScreen = 'Main_screen';
    });
  }

  void onSelectedAnswer(String answer) {
    choosedAnswer.add(answer);

    if (choosedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'Result_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget startScreen = StartScreenPage(startQuiz: swtichScreen);

    if (activeScreen == 'Question_screen') {
      startScreen = QuestionScreen(setAnswer: onSelectedAnswer);
    }

    if (activeScreen == 'Result_screen') {
      startScreen =
          ResultScreenPage(chosenAnswer: choosedAnswer, onRestart: restartQuiz);
    }
    return MaterialApp(
      home: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 38, 162),
            Color.fromARGB(255, 33, 26, 233)
          ])),
          child: startScreen),
    );
  }
}

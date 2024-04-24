import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/widgets/numbering_container.dart';

class ResultSummaryScreen extends StatelessWidget {
  const ResultSummaryScreen({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      NumberingContainer(
                        data: e['question_index'] as int,
                        selectedColor: e['choose_answer'] == e['correct_answer']
                            ? const Color.fromARGB(255, 13, 142, 17)
                            : Colors.red,
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                e['question'] as String,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                e['choose_answer'] as String,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: e['choose_answer'] ==
                                            e['correct_answer']
                                        ? const Color.fromARGB(255, 9, 226, 9)
                                        : const Color.fromARGB(255, 216, 7, 7),
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                e['correct_answer'] as String,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: const Color.fromARGB(255, 9, 226, 9),
                                    decoration: TextDecoration.none),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ]),
                      ))
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

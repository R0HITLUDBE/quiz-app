import 'package:flutter/material.dart';
import 'package:flutter_basics/models/data/questions.dart';
import 'package:flutter_basics/questions_summary.dart';
import 'package:flutter_basics/styled_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.resetData});

  final List<String> chosenAnswer;
  final void Function() resetData;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numberTotalQuestion = questions.length;
    final numCorrectQuestions = summaryData
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;

    return (SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StyledText(
                  'You answered $numCorrectQuestions out of $numberTotalQuestion questions correctly!',
                  20),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: resetData,
                label: const StyledText('Restart Test', 18),
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              )
            ])),
      ),
    ));
  }
}

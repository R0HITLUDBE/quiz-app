import 'package:flutter/material.dart';
import 'package:flutter_basics/models/data/questions.dart';
import 'package:flutter_basics/questions_screen.dart';
import 'package:flutter_basics/results_screen.dart';
import 'package:flutter_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    // setState(() {
    //   activeScreen = const QuestionsScreen();
    // });
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String ans) {
    selectedAnswers.add(ans);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void resetQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        resetData: resetQuiz,
      );
    }

    return (MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: screenWidget,
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_basics/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return (Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(173, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          const StyledText('Learn Flutter the fun way!', 22),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: const StyledText('start quiz', 16),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
          )
        ],
      ),
    ));
  }
}

// 
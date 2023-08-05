import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.fontsize, {super.key});

  final String text;
  final double? fontsize;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
      ),
      textAlign: TextAlign.center,
    );
  }
}

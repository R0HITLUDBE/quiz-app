import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: (Column(
          children: summaryData
              .map(
                (item) => (Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: item['user_answer'] == item['correct_answer']
                              ? Colors.lightGreen
                              : Colors.pink[200],
                          shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Text(
                        ((item['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['question'] as String,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            item['user_answer'] as String,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            item['correct_answer'] as String,
                            style:
                                const TextStyle(color: Colors.lightGreenAccent),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                )),
              )
              .toList(),
        )),
      ),
    );
  }
}

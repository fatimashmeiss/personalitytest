import 'package:flutter/material.dart';
import '../questions.dart';
import '/personality.dart';

class QuestionScreen extends StatelessWidget {
  final void Function(Personality) answerQuestion;
  final int questionIndex;

  QuestionScreen({required this.answerQuestion, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ...currentQuestion.answers.map((answerData) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                onPressed: () => answerQuestion(answerData.personality),
                child: Text(answerData.text),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

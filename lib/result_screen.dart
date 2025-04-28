import 'package:flutter/material.dart';
import '../personality.dart';

class ResultScreen extends StatelessWidget {
  final Personality resultPersonality;
  final void Function() restartTest;

  ResultScreen({required this.resultPersonality, required this.restartTest});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            personalityMessages[resultPersonality]!,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: restartTest, child: Text('Restart Test')),
        ],
      ),
    );
  }
}

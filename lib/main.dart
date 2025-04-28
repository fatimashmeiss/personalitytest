import 'package:flutter/material.dart';
import '/personality.dart';
import '/questions.dart';
import '/start_screen.dart';
import '/question_screen.dart';
import '/result_screen.dart';

void main() {
  runApp(const PersonalityTestApp());
}

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({super.key});

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  bool testStarted = false;
  bool testCompleted = false;
  int questionIndex = 0;
  Map<Personality, int> scores = {
    Personality.thinker: 0,
    Personality.feeler: 0,
    Personality.planner: 0,
    Personality.adventurer: 0,
  };
  Personality? result;

  void startTest() {
    setState(() {
      testStarted = true;
    });
  }

  void answerQuestion(Personality type) {
    scores[type] = scores[type]! + 1;

    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // Find the personality with the highest score
      result = scores.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
      setState(() {
        testCompleted = true;
      });
    }
  }

  void restartTest() {
    setState(() {
      testStarted = false;
      testCompleted = false;
      questionIndex = 0;
      scores = {
        Personality.thinker: 0,
        Personality.feeler: 0,
        Personality.planner: 0,
        Personality.adventurer: 0,
      };
      result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 143, 216),
        body:
            !testStarted
                ? StartScreen(startTest: startTest)
                : !testCompleted
                ? QuestionScreen(
                  answerQuestion: answerQuestion,
                  questionIndex: questionIndex,
                )
                : ResultScreen(
                  resultPersonality: result!,
                  restartTest: restartTest,
                ),
      ),
    );
  }
}

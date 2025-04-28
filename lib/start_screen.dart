import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startTest;

  StartScreen({required this.startTest});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover Your Personality Type!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: startTest, child: Text('Start Test')),
        ],
      ),
    );
  }
}

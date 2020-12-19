import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = const [
    {
      "question": "What is your favorite color?",
      "answer": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 5},
        {"text": "White", "score": 3},
        {"text": "Brown", "score": 7}
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answer": [
        {"text": "Dog", "score": 10},
        {"text": "Rabbit", "score": 4},
        {"text": "Horse", "score": 5},
        {"text": "Bat", "score": 0},
        {"text": "Cat", "score": 3}
      ]
    },
    {
      "question": "Who's your favorite Person?",
      "answer": [
        {"text": "Tanvi", "score": 10}
      ]
    }
  ];

  var _count = 0;
  int _totalscore=0;
  void _changeQuestion(int score) {
    _totalscore +=score;
    setState(() {
      _count++;
    });
  }
  void _reset(){
    setState(() {
      _totalscore=0;
      _count=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Personality Detection'),
            ),
            body: _count < _questions.length
                ? Quiz(
                    changeQuestion: _changeQuestion,
                    questions: _questions,
                    count: _count)
                : Result(_totalscore,_reset)),
      ),
    );
  }
}

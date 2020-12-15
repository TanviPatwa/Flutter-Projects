import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final int count;
  final Function changeQuestion;

  Quiz({
    @required this.changeQuestion,
    @required this.questions,
    @required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[count]['question']),
      ...(questions[count]['answer'] as List<Map<String,Object>>).map((ans) {
        // creating object ie returning answer widget according to option present
        return Answer(()=>changeQuestion(ans['score']), ans['text']);
      }).toList()
    ]);
  }
}

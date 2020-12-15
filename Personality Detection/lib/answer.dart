import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function changeOption;
  final String questionText;
  Answer(this.changeOption,this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(questionText),
        onPressed: changeOption,
        color: Colors.blue,
      ),
    );
  }
}

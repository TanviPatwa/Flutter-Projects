import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalscore;
  final Function resetpg;

  Result(this.totalscore,this.resetpg);

  String get resultp {
    var resulttext = "You did it!";
    if (totalscore <= 8)
      resulttext = "You are innocent and honest!";
    else if (totalscore <= 15)
      resulttext = "You are most likely!";
    else
      resulttext = "You are amazing!";
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultp,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          child: Text("Restart Quiz"),
          onPressed: resetpg,
        )
      ]),
    );
  }
}

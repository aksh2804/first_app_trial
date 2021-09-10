import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int endScore;
  final Function restartFunction;

  Result({this.restartFunction, this.endScore});

  String get resultPhase {
    String resultText;
    if (endScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (endScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (endScore <= 16) {
      resultText = 'You are ... Strange!';
    } else {
      resultText = 'You are bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            endScore.toString() , //resultPhase
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.amber,
            onPressed: restartFunction,
          ),
        ],
      ),
    );
  }
}

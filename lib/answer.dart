import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function ptrToFunction;
  final String answerText;

  Answer(this.ptrToFunction, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            elevation: 0.0,
            
            color: Colors.red.shade500,
            textColor: Colors.black87,
            child: Text(answerText,style: TextStyle(color: Colors.white),),
            onPressed: ptrToFunction, //named function
          )),
    );
  }
}

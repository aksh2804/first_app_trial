import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>>
      ques; //list of maps having keys=string and values=any Object
  final int quesIndex;
  final Function answerQues; // function ptr

  Quiz({
    @required this.answerQues, // finction ptr
    @required this.ques,
    @required this.quesIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Question(
          ques[quesIndex]['ques'], //questions.elementAt(0)
        ),
        Column(children: [
         ...(ques[quesIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQues(answer['score']), answer['text']);
        }).toList()
        ],),
        // /list of Answer() widgets
      ],
    );
  }
}

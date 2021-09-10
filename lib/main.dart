import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   return runApp(MyApp());
// }

void main() {
  return runApp(MyApp());
}
//  runApp(MyApp()); //this syntax used for executing only 1 statement in func

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'ques': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 1},
        {'text': 'Violet', 'score': 2},
        {'text': 'Black', 'score': 10},
        {'text': 'green', 'score': 6},
      ],
    },
    {
      'ques': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Dog', 'score': 7},
        {'text': 'Bird', 'score': 2},
        {'text': 'Elephant', 'score': 5},
      ]
    },
    {
      'ques': 'What\'s your favourite Indian city?',
      'answers': [
        {'text': 'New Delhi', 'score': 3},
        {'text': 'Indore', 'score': 5},
        {'text': 'Mumbai', 'score': 7},
        {'text': 'Srinagar', 'score': 1},
      ]
    },
  ];
  //State class is generic class
  //State<MyApp> is connection of MyAppState class to MyApp class
  var _questionIndex = 0;
  var _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    //print(_questions[_questionIndex]);

    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // const means we are fixing the address of value stored in variable/ fixing the value iteself at compile time
    // questions = [];
    // final x = ['hello'];   //final means if variable initilaised once then it can't be initialised again at runtime
    // x.add('Max');
    // x = [];
    // print(x);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: Text("My First App"),
            elevation: 1.0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.red, Colors.blue])),
            child: (_questionIndex < _questions.length)
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Quiz(
                      answerQues: _answerQuestions,
                      ques: _questions,
                      quesIndex: _questionIndex,
                    ),
                  )
                : Result(restartFunction: _restartQuiz, endScore: _totalScore),
          )),
    );
  }
}




// class Aksit extends StatefulWidget {
//   const Aksit({ Key? key }) : super(key: key);

//   @override
//   _AksitState createState() => _AksitState();
// }

// class _AksitState extends State<Aksit> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }
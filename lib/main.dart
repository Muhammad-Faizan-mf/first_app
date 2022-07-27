import 'package:first_app/answer.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Red', 'score': 5},
          {'text': 'Yellow', 'score': 15},
          {'text': 'Green', 'score': 1},
          {'text': 'Blue', 'score': 12}
        ],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 5},
          {'text': 'Cat', 'score': 15},
          {'text': 'Elephant', 'score': 1},
          {'text': 'Ant', 'score': 12}
        ],
      },
      {
        'questionText': 'Who is your favourite instructor?',
        'answers': [
          {'text': 'Me', 'score': 5},
          {'text': 'Faizan', 'score': 15},
          {'text': 'Bablo', 'score': 1},
          {'text': 'BHB', 'score': 12}
        ],
      },
    ];
    void _answerQuestion(int score) {
      _totalScore += score;
      setState(() {
        _questionIndex++;
      });
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('Questions are remaining');
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

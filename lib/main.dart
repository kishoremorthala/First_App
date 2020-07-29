//Call system functions(Widgets)
import 'package:flutter/material.dart';
//Importing other pages
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //overrides pevious widget
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Fruit?',
      'answers': [
        {'text': 'Apple', 'score': 10},
        {'text': 'Banana', 'score': 12},
        {'text': 'Cherries', 'score': 14},
        {'text': 'Dragon Fruit', 'score': 15},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Flowers?',
      'answers': [
        {'text': 'Rose', 'score': 10},
        {'text': 'Lotus', 'score': 12},
        {'text': 'Jasmine', 'score': 14},
        {'text': 'Sun Flower', 'score': 15},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kishore Reddy Morthala'),
          backgroundColor: Colors.green,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        bottomNavigationBar: BottomAppBar(
          child: Text('Kishroe Reddy Morthala'),
          color: Colors.green,
        ),
      ),
    );
  }
}

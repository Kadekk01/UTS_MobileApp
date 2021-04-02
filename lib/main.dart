import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Ada berapa warna dalam pelangi?',
        'answers': ['7 Warna', '6 Warna', '2 Warna', '8 Warna', '10 Warna'],
      },
      {
        'questionText': 'Mau pilih siapa, aku atau dia?',
        'answers': ['Kamu donk', 'Dia aja'],
      },
      {
        'questionText': 'Tujuan anda hidup apa?',
        'answers': ['Rebahan', 'Wanita', 'Pahala', 'Uang'],
      },
    ];

    var _questionIndex = 0;

    void _answerQuestion() {
      // var aBool = true;
      // aBool = false;

      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
      if (_questionIndex < questions.length) {
        print('Kita masih punya pertanyaan!');
      } else {
        print('tidak ada pertanyaan lagi!');
      }
    }

    @override
    Widget build(BuildContext context) {
      // var dummy = const ['Hello'];
      // dummy.add('Max');
      // print(dummy);
      // dummy = [];
      // questions = []; // does not work if questions is a const

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Aplikasi quiz'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          ),
        ),
      );
    }
  }
}

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
       'questionText': 'Apa warna favorit anda?',
       'answers': ['Hitam', 'Merah', 'Hijau', 'Putih'],
     },
     {
       'questionText': 'Apa peliharaan favorit anda?',
       'answers': ['Anjing', 'kucing', 'Burung', 'Ular'],
     },
     {
       'questionText': 'Berapa jumlah peliharaan anda?',
       'answers': ['1 ekor', '2 ekor', '3 ekor', '4 ekor'],
     },
   ];
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

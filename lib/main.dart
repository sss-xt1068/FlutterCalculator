import 'dart:core';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

// List themes = new List(darkTheme, normalTheme);
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.brown[800],
  primaryColorBrightness: Brightness.dark,
  primaryIconTheme: IconThemeData(color: Colors.amber[700], size: 40),
);
ThemeData normalTheme = ThemeData(
  primaryColor: Colors.blue,
  primaryColorBrightness: Brightness.light,
  primaryIconTheme: IconThemeData(color: Colors.amber[300], size: 40),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCalc',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        //,)primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyCalc(),
    );
  }
}

class MyCalc extends StatefulWidget {
  @override
  MyCalcState createState() => MyCalcState();
}

class MyCalcState extends State<MyCalc> {
  String _toeval = '';
  String _output = '0';
  String past = '';
  String result = '';

  Widget buildButton(String value) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blue[100],
        child: Text(
          value,
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        onPressed: () {
          setState(
            () {
              if (value == '=') {
                Parser p = Parser();
                Expression exp = p.parse(_toeval);
                result = exp.evaluate(EvaluationType.REAL, null).toString();
                print(result);
                _output = result;
                _toeval = '';
              } else if (value == 'Clear') {
                past = result;
                _toeval = '';
                _output = _toeval;
              } else if (value == 'History+') {
                //past = _output;
                _toeval += past;
                _output = _toeval;
              } else {
                _toeval += value;
                _output = _toeval;
              }
            },
          );
        },
      ),
    );
  }

  var myStyleHistory = TextStyle(fontSize: 22, fontFamily: 'Montserrat');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator by SSS'),
      ),
      body: Container(
        child: Wrap(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: 120,
              child: Text(
                'History: ' + past,
                style: myStyleHistory,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 100,
              child: Text(_output,
                  style: TextStyle(
                      fontSize: 60,
                      color: Colors.black,
                      fontFamily: 'Montserrat')),
            ),
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('*')
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('/')
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-')
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('00'),
                buildButton('0'),
                buildButton('.'),
                buildButton('+')
              ],
            ),
            Row(
              children: <Widget>[buildButton('Clear'), buildButton('=')],
            ),
            Row(
              children: <Widget>[
                buildButton('History+'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

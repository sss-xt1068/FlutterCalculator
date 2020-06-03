import 'dart:core';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _toeval = '';
  String _output = '0';
  String past = '';
  var result;
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color:
            darkMode ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: GestureDetector(
                child: Container(
                  height: 40,
                  color: darkMode ? Colors.amber : Colors.pink[100],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // darkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                        'Double tap to switch',
                        style: TextStyle(
                          color: darkMode
                              ? Theme.of(context).textSelectionColor
                              : Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.settings_brightness,
                        color: darkMode ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
                onDoubleTap: () {
                  setState(() {
                    darkMode = !darkMode;
                  });
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: Container(
                alignment: Alignment.topCenter,
                height: double.infinity,
                child: Text(
                  'History: ' + past,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    color: darkMode
                        ? Theme.of(context).textSelectionColor
                        : Colors.black,
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 9,
              child: Container(
                alignment: Alignment.centerRight,
                width: double.infinity,
                height: double.infinity,
                child: Text(
                  _output,
                  style: TextStyle(
                      fontSize: 60,
                      color: darkMode
                          ? Theme.of(context).textSelectionColor
                          : Colors.black,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('*')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('/')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('00'),
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('+')
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('Clear'),
                  buildButton('='),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                children: <Widget>[
                  buildButton('History+'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: darkMode ? Colors.grey[800] : Colors.blue[100]),
        child: MaterialButton(
          // height: 45,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 26,
                color: darkMode ? Colors.amber[700] : Colors.black),
          ),
          onPressed: () {
            setState(
              () {
                if (value == '=') {
                  Parser p = Parser();
                  Expression exp = p.parse(_toeval);
                  result = exp
                      .evaluate(EvaluationType.REAL, null)
                      .toStringAsFixed(2);
                  // print(result.toStringAsFixed(3));
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
      ),
    );
  }
}

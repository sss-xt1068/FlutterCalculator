import 'dart:core';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

var myStyleHistory = TextStyle(fontSize: 22, fontFamily: 'Montserrat');

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: Container(
              alignment: Alignment.topCenter,
              height: double.infinity,
              child: Text(
                'History: ' + past,
                style: myStyleHistory,
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
                    color: Colors.black,
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
              children: <Widget>[buildButton('Clear'), buildButton('=')],
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
    );
  }

  String _toeval = '';
  String _output = '0';
  String past = '';
  var result;

  Widget buildButton(String value) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.blue[100], Colors.blue[300]], radius: 2.5),
        ),
        child: MaterialButton(
          // height: 45,
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

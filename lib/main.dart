import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String toeval = '';
  String output = '0.0';
  String getAnswer(String operation) {
    Parser p = Parser();
    Expression exp = p.parse(operation);
    String result = exp.evaluate(EvaluationType.REAL, null).toString();
    print(result);
    output = result;
    toeval = '';
    return output;
  }

  Widget buildButton(String value) {
    return Expanded(
      child: MaterialButton(
        color: Colors.purple[100],
        child: Text(
          value,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onPressed: () => {
          if (value == '=')
            {output = getAnswer(toeval)}
          else if (value == 'Clear')
            {toeval = '', output = ''}
          else
            {toeval += value}
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AwesomeCalculator'),
      ),
      body: Container(
        child: Wrap(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 250,
              child: Text(
                toeval.contains('=') ? output : toeval,
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('*'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('00'),
                buildButton('0'),
                buildButton('.'),
                buildButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                //buildButton('00'),
                //buildButton('5'),
                buildButton('Clear'),
                buildButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

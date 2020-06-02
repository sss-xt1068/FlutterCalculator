import 'dart:core';
import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/notes.dart';
import 'package:calculator/pages/weather.dart';
import 'package:flutter/material.dart';

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
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int curIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('MultiPurpose'),
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              NavigationRail(
                selectedIndex: curIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    curIndex = index;
                  });
                  // print('pupupupu ' + curIndex.toString());
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.calendar_today),
                    selectedIcon: Icon(Icons.calendar_today),
                    label: Text('Calendar'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add),
                    selectedIcon: Icon(Icons.add_box),
                    label: Text('Calculator'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.wb_sunny),
                    selectedIcon: Icon(Icons.wb_cloudy),
                    label: Text('Weather'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.add_circle),
                    selectedIcon: Icon(Icons.note_add),
                    label: Text('Quiknote'),
                  ),
                ],
                groupAlignment: 0.0,
                elevation: 20,
                minWidth: 30,
                selectedLabelTextStyle: TextStyle(color: Colors.deepPurple),
                selectedIconTheme: IconThemeData(color: Colors.deepPurple),
              ),
              showPage(curIndex)
            ],
          ),
        ),
      ),
    );
  }

  Widget showPage(int curIndex) {
    switch (curIndex) {
      case 0:
        print('Case 0 bro...');
        return Calculator();
        break;
      case 1:
        print('Case 1 bro..');
        return Calculator();
        break;
      case 2:
        print('Case 2 bro..');
        return WeatherPage();
      case 3: 
      print('Case 3 bro');
      return QuikNote();
      break;
      default:
        return QuikNote();
    }
  }
}

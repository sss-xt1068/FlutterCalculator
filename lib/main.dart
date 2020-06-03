import 'dart:core';
import 'package:calculator/pages/calculator.dart';
import 'package:calculator/pages/notes.dart';
import 'package:calculator/pages/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActivityCombo',
      theme: ThemeData(
          primaryColorDark: Colors.grey[200],
          primaryColor: Colors.deepPurple[100],
          highlightColor: Colors.orange,
          accentColorBrightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black87,
          accentColor: Colors.orange,
          buttonColor: Colors.amber,
          textSelectionColor: Colors.white),
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
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('ActivityCombo'),
      ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              NavigationRail(
                backgroundColor: Color.fromRGBO(154,219,246, 0.75),
                selectedIndex: curIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    curIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
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
                selectedIconTheme:
                    IconThemeData(color: Colors.amber),
                selectedLabelTextStyle:
                    TextStyle(color: Colors.amber[500]),
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
        return new WeatherPage();
        break;
      case 2:
        print('Case 2 bro..');
        return QuikNote();
      default:
        return QuikNote();
    }
  }
}

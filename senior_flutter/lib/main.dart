import 'package:flutter/material.dart';

import './constants/colors.dart';
import './widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sênior - Dev. Flutter',
      theme: ThemeData(
          primaryColor: myPrimaryColor,
          backgroundColor: myBackgroundColor,
          textTheme: TextTheme(
            headline5: TextStyle(
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          )),
      home: MyHomePage(),
    );
  }
}

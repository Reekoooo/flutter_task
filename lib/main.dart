import 'package:flutter/material.dart';
import 'package:flutter_task/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',

        //primarySwatch: Colors.teal,
        accentColor: Colors.teal[900],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



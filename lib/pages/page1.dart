import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      child: Text("Page 1",style: TextStyle(fontSize: 50.0),),
    ));
  }
}
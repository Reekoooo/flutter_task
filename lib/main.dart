import 'package:flutter/material.dart';
import 'package:flutter_task/pages/page1.dart';
import 'package:flutter_task/pages/page2.dart';
import 'package:flutter_task/ui_components/custom_rect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'صوت تنبيه يارب';
  double Y_offset = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFAB(),
      bottomNavigationBar: buildBottomAppBar(context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
    );
  }

  Column buildBody(BuildContext context) {
    List<String> _items = [
      'صوت تنبيه يارب',
      'صوت تنبيه 2',
      'صوت تنبيه 3',
      'صوت تنبيه 4',
    ];

    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
        ),
        Expanded(
          child: ClipPath(
            clipper: CustomRect(yOffset: Y_offset),
            child: Container(
              color: Colors.teal[900],
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Colors.teal[900],
                        ),
                        child: DropdownButton<String>(
                          underline: Container(),
                          iconSize: 35.0,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Cairo'),
                          icon: Icon(
                            Icons.arrow_drop_down_circle,
                            color: Colors.white,
                          ),
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: _items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    " تنبيه الشروق",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Transform buildFAB() {
    return Transform.translate(
      offset: Offset(0.0, Y_offset),
      child: FloatingActionButton(
          child: Icon(Icons.zoom_out_map), onPressed: () {}),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 32.0, left: 32.0, right: 32.0),
                child: IconButton(
                  icon: Icon(
                    Icons.access_alarms,
                    size: 35.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Material(child: Page1())));
                  },
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, Y_offset),
                child: Text(
                  "الرئيسية",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 32.0, left: 32.0, right: 32.0),
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.compass,
                    size: 30.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Material(child: Page2())));
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 40.0,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 3.0,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

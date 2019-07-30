import 'package:flutter/material.dart';
import 'package:flutter_task/pages/page1.dart';
import 'package:flutter_task/pages/page2.dart';
import 'package:flutter_task/ui_components/custom_rect.dart';
import 'package:flutter_task/ui_components/slide_left_route.dart';
import 'package:flutter_task/ui_components/slide_right_route.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _items = [
    'صوت تنبيه يارب  ',
    'صوت تنبيه 2',
    'صوت تنبيه 3',
    'صوت تنبيه 4',
  ];
  String dropdownValue ;

  double Y_offset = 12.0;

  @override
  void initState() {
    super.initState();
    dropdownValue = _items[0];
  }

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

    final double _upperHieght = MediaQuery.of(context).size.height/6;
    return Column(
      children: <Widget>[
        Container(
          //height: _upperHieght,
        ),
        Expanded(
          child: ClipPath(
            clipper: CustomRect(yOffset: Y_offset),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill,
                )
              ),
              //color: Colors.teal[900],
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
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
                          child: Container(
                            height: 38.0,
                            padding: EdgeInsets.only(right: 8.0),


                            decoration: BoxDecoration(
                              color: Color(0xFF013A33),
                              borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [BoxShadow(
                                    color:  Colors.black.withOpacity(0.5),
                                    blurRadius: 0.0,
                                  offset: Offset(0, 1),
                                  spreadRadius: 1.0,
                                  ),
                                ],
                            ),

                            child: DropdownButton<String>(
                              underline: Container(),

                              iconSize: 35.0,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Cairo',letterSpacing: 3),
                              icon: Icon(
                                IconData(0xe900, fontFamily: 'caret_down_circle'),
                                //Icons.arrow_drop_down_circle,
                                color: Colors.white,
                                size: 30.0,
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
                                    child: Text(value,textDirection: TextDirection.rtl,),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      " تنبيه الشروق",
                      style: TextStyle(color: Colors.white,letterSpacing: 3),
                    ),
                    Spacer(),
                  ],
                ),
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
      child:Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.transparent,
            child: Image.asset('assets/ellipse_1.png'),
          ),

          Container(
            height: 70.0,
            color: Colors.transparent,
            child: Image.asset('assets/fab_background.png'),
          ),
          InkWell(
            onTap: (){print('tap pressed');},
            child: Container(
              height: 40.0,
              color: Colors.transparent,
              child: Image.asset('assets/fab_icon.png'),
            ),
          )

        ],
      )
//      FloatingActionButton(
//          child: Icon(
//            IconData(0xe900, fontFamily: 'fourrect'),size: 35.0,),
//          onPressed: () {}),
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
                    top: 4.0, bottom: 32.0, left: 32.0, right: 32.0),
                child: IconButton(
                  icon: Icon(
                    IconData(0xe903, fontFamily: 'caret_down_circle'),
                    //Icons.access_alarms,
                    size: 35.0,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  onPressed: () {
                    Navigator.push(context, SlideRightRoute(page: Material(child: Page1())));
                  },
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, Y_offset),
                child: Text(
                  "الرئيسية",
                  style: TextStyle(fontSize: 10.0,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 32.0, left: 32.0, right: 32.0),
                child: IconButton(
                  icon: Icon(
                    IconData(0xe904, fontFamily: 'caret_down_circle'),
                    size: 35.0,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                  onPressed: () {
                    Navigator.push(context, SlideLeftRoute(page: Material(child: Page2())));
                  },
                ),
              ),
            ],
          ),
//          Container(
//            height: 40.0,
//            decoration: BoxDecoration(color: Colors.white, boxShadow: [
//              BoxShadow(
//                color: Colors.black.withOpacity(0.5),
//                blurRadius: 3.0,
//              ),
//            ]),
//          )
        ],
      ),
    );
  }
}
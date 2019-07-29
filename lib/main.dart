import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
          ),
          Expanded(
            child: ClipPath(
              clipper: CustomRect(),
              child: Container(
                color: Colors.blue,
                child: Row(
                  children: <Widget>[

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out_map),
          onPressed: (){}),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: IconButton(icon: Icon(Icons.access_alarm), onPressed: () {},),
            ),
            Text("الرئيسية",style: TextStyle(fontSize: 20.0),),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: IconButton(icon: Icon(Icons.explore), onPressed: () {},),
            ),
          ],
        ),
      ),
//      body: Center(
////        child: Column(
////          mainAxisAlignment: MainAxisAlignment.end,
////          children:  <Widget>[
////            BottomAppBar(
////
////              child: new Row(
////                mainAxisSize: MainAxisSize.max,
////                mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                children: <Widget>[
////                  IconButton(icon: Icon(Icons.menu), onPressed: () {},),
////                  IconButton(icon: Icon(Icons.search), onPressed: () {},),
////                ],
////              ),
////            ),
////          ],
////
////    ),
//      ),
    );
  }
}
class CustomRect extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo((size.width/2)-40.0, size.height);
    path.addArc(Rect.fromCircle(center: Offset(size.width/2, size.height),radius: 40.0), -3.14,3.14);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }


}

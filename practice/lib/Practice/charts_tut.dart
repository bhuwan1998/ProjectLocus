import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// test run for the graphs 


void main() => runApp(AnApp());

class AnApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Charts Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        home: MyPage(title: 'Sales DashBoard 2018'),
      );
    
  }
}

class MyPage extends StatefulWidget{
  MyPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyPageState createState() => _MyPageState();

}

class _MyPageState extends State<MyPage> {

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];


  List<CircularStackEntry> circularData = <CircularStackEntry> [
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),

      ],
      rankKey: 'Quarterly Profits'
    ),
  ];


  Material myTextItems(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Color(0x802196F3),

    );
  }
  @override
  Widget build(BuildContext context){

  }
}
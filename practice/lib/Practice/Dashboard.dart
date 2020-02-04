import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class WeekView extends StatelessWidget {

  


  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Flutter Application",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashBoard(title: 'Time Management App')
    );
  }
}

class MyDashBoard extends StatefulWidget{

  MyDashBoard({Key key, this.title}): super(key : key);
  final String title;

  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {

  TextStyle content = TextStyle(fontFamily: "Avenir", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  TextStyle title = TextStyle(fontFamily: 'Avenir', fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);



  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard", style: title,)
      ),
      body: ListView(
        children: <Widget>[ Center(
        child: Container(
        color: Colors.grey.shade300,
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                Container(  
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  height: 100,
                  width: 100,  
                    
                 
                  child: Text('Monday', style: content ),
                ),
                Container(
                   padding: const EdgeInsets.only(right:10, top: 30),
                  height: 100,
                  width: 100,
                  child: Text('Tuesday', style: content),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 0, top: 30),
                  height: 100,
                  width: 180,
                  child: Text('Wednesday',style: content ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  height: 100,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300,
                    boxShadow: [BoxShadow(
                      offset: Offset(-10,-10),
                      color: Colors.white.withOpacity(0.85),
                      blurRadius: 20,
                    )]
                    
                  ),
                  
                  child: Text("Thursday", style: content, textAlign: TextAlign.center,),
                ),
              ],
            ),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                   padding: const EdgeInsets.all(10),
                  height: 10,
                  width: 20,
                  
                  child: Text('Friday', style: content)
                ),
                Container(
                  
                 padding: const EdgeInsets.only(left: 80, top: 30),
                  height: 100,
                  width: 200,                 
                  child: Text('Saturday', style: content, textAlign: TextAlign.center,)
                ),

              ],
            ),
          ],
        
        ),
      ),
        ),
        ],
        
      ),
    );
  }
}
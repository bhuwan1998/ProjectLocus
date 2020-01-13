 import 'package:flutter/material.dart';
import 'package:practice/Practice/courses.dart';
import 'package:practice/Practice/overview.dart';



 

 void main() => runApp(MyApp());


 class MyApp extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     return MaterialApp(
       title: 'Flutter Login UI',
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.blue,
       ),
       home: MyHomePage(title: 'Flutter Login'),
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
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);


      String fullName = "";
      String uniName = "";

      @override
      Widget build(BuildContext context) {

        final name = TextField(
          onChanged: (text) { fullName = text;},
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 20,left: 30.0, right: 30.0),
              hintText: "Your Full Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final univName = TextField(
          onChanged: (text) { uniName = text;},
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 30, right: 30, left: 30),
              hintText: "University Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(32.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Course())
              );
            },
            child: Text("Next",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  
                    SizedBox(height: 45.0),
                    name,
                    SizedBox(height: 25.0),
                    univName,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }



  class SecondRoute extends StatefulWidget{

      @override
      _SecondRouteState createState() => _SecondRouteState();
    }




  class _SecondRouteState extends State<SecondRoute>{

  TextStyle styles = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  static String courseNames = "";
  List courses = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("COURSES",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Column(children: <Widget>[ Container(
        padding: EdgeInsets.all(20),
        child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        width: 500,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blue[200],
          blurRadius: 10, ),
          ],),
        child: Column(children: <Widget>[
          Container(padding: EdgeInsets.all(20),),
          Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            Text("Course 1",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
                    ),),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextField( 
                  autocorrect: true,
                  autofocus: true,
                  onChanged: (text) {courseNames = text;
                  courses.add(courseNames);
                  },
                  obscureText: false,
                  style: styles,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20, left: 30.0, right: 30.0),
                    hintText: "Course Name ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),                                  
                  ),
                ),
                )
                
               ],
            
              ),
            ),
            
          ),
          SizedBox(height: 20,),
          RaisedButton(
            hoverElevation: 20,
            child: Text("Next"),
            elevation: 4,
            color: Colors.blue[300],
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Overview())
              );
            },
          ),
         
          
          
          ],
      ),

     );
    }
  }

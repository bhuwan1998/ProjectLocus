import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:practice/Practice/CourseClass.dart';
import 'package:practice/Practice/CourseType.dart';
import 'package:practice/Practice/classTime.dart';
import 'package:practice/Practice/form.dart';


import 'overview.dart';


class CourseTypes{
  String label;
  CourseType courseType;

  CourseTypes( String label, CourseType courseType){
    this.label = label;
    this.courseType = courseType;
  }



static List<CourseTypes> getCourseTypes() {
   return <CourseTypes> [
    CourseTypes("Lectures", CourseType.Lecture),
    CourseTypes("Labs",  CourseType.Labs),
    CourseTypes("Seminar", CourseType.Seminar),
   CourseTypes("Tutorial", CourseType.Tutorial),
   ];
  }
}



//class dropdown list 

class DropDown extends StatefulWidget{
  DropDown() : super();

  final String title = 'DropDown Demo';

  @override 
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<DropDown>{
 List<CourseTypes> _courseTypes = CourseTypes.getCourseTypes();
 List<DropdownMenuItem<CourseTypes>> _courseItems;
 CourseTypes _selectedCourseType;

 @override // overriding the init state 
 void initState() {
   _courseItems = buildDropDownMenuItem(_courseTypes);
   _selectedCourseType = _courseItems[0].value;

   super.initState();
 }

 List<DropdownMenuItem<CourseTypes>> buildDropDownMenuItem(List courseTypes) {
   List<DropdownMenuItem<CourseTypes>> items = List();
   for(CourseTypes type in courseTypes){
     items.add(DropdownMenuItem(
       value: type, 
       child: Text(type.label),
        ),
      );
   }
   return items;
 }


 onChangedDropDownItem(CourseTypes selectedType){
   setState(() {
     _selectedCourseType = selectedType;
   });

 }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text("Select type of class for the Course"),
        SizedBox(height: 10,),
        DropdownButton(
           value: _selectedCourseType,
          items: _courseItems,
          onChanged: onChangedDropDownItem,
        ),
        SizedBox(height: 10,),
        Text('Selected: ${_selectedCourseType.label}'),
      ],),
    );
  }

}


class Course extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Course> {
  
  int uiCourseNo = 1;
  
  int cNumber;
  String courseName = "";
  TextEditingController courseNumber = new TextEditingController();
  int appCourseNumber = 1;
  String initialCourse = "Course 1";
  TextStyle style =
      TextStyle(fontFamily: "Montserrat", fontSize: 25, color: Colors.black);

  void increment() {
    setState(() {
      uiCourseNo++;
    });

  }

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
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: <Widget> [
        Column(children: <Widget>[ Container(
        padding: EdgeInsets.all(20),
        child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        width: 500,
        height: 400,
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
           
            Text("Course $uiCourseNo",
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
                  onChanged: (text) {
                    courseName = text;
                  },
                  obscureText: false,
                  style: style,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20, left: 30.0, right: 30.0),
                    hintText: "Course Name ",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),                                  
                  ),
                ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                DropDown(),
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
      ),],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => ClassTime(courseName) ),
          );
         },
        child: Icon(Icons.add),
        elevation: 10,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        focusColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(height: 50,),
        elevation: 20,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     );

    }
  }






import 'package:flutter/material.dart';
import 'package:practice/Practice/CourseType.dart';
import 'package:practice/Practice/main.dart';

class ClassTime extends StatefulWidget{
  String name;
  ClassTime(String name){
    this.name = name;
  }
  @override
  _ClassTimeState createState() => _ClassTimeState(name);
}


class _ClassTimeState extends State<ClassTime>{
  String courseName;
  bool monday = false;
  bool tuesday = false;
  bool wednesay = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;
  bool sunday = false;
  List<int> days = [];
  Future<TimeOfDay> timeFrom;
  Future<TimeOfDay> timeto;
  bool repeats = false;
  _ClassTimeState (String name){
    this.courseName = name;
  }

  TextStyle weekdayStyle = TextStyle(fontFamily: 'Avenir', fontSize: 10, fontWeight: FontWeight.bold);
  TextStyle titles = TextStyle(fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold );

  classTime(String courseName){
    this.courseName = courseName;
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Scheduling Courses")),
    body: Center(
      child: Container(
        margin: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Repeats: ', style: titles,),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // seven containers with columns in them for all the days and their check boxes
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Monday', style: weekdayStyle,),
                          Checkbox(
                            value: monday,
                            onChanged: (value) {
                              if(!this.days.contains(0)){
                                this.days.add(0);
                              }
                              else{
                                this.days.remove(0);
                              }
                              setState(() {
                                monday = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ) ,
                  ),
                     //1
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Tuesday', style: weekdayStyle),
                          Checkbox(
                            value: tuesday,
                            onChanged:(value){
                              if(!this.days.contains(1)){
                                this.days.add(1);
                              }
                              else{
                                this.days.remove(1);
                              }
                              setState(() {
                                tuesday = value;
                              });
                            } ,)
                        ],
                       ),
                     ),
                    ),//2
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Wednesday', style: weekdayStyle,),
                          Checkbox(
                            value: wednesay,
                            onChanged: (value) {
                              if(!this.days.contains(2)){
                                this.days.add(2);
                              }
                              else{
                                this.days.remove(2);
                              }
                              setState(() {
                                wednesay = value;
                              });
                            },
                          ),
                        ],),
                      ),
                    ), //3
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Thursday', style: weekdayStyle),
                          Checkbox(
                            value: thursday,
                            onChanged: (value) {
                              if(!this.days.contains(3)){
                                this.days.add(3);
                              }
                              else{
                                this.days.remove(3);
                              }
                              setState(() {
                                thursday = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ), //4
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Friday', style: weekdayStyle,),
                          Checkbox(
                            value: thursday,
                            onChanged: (value) {
                              if(!this.days.contains(4)){
                                this.days.add(4);
                              }
                              else{
                                this.days.remove(4);
                              }
                              setState(() {
                                friday = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ), //5
                  Container( 
                    child: Center(
                      child: Column(
                          children: <Widget>[
                            Text('Saturday', style: weekdayStyle),
                            Checkbox(
                              value: saturday,
                              onChanged: (value) {
                                if(!this.days.contains(5)){
                                  this.days.add(5);
                                }
                                else{
                                  this.days.contains(5);
                                }
                                setState(() {
                                  saturday = value;
                                });
                              },
                            ),
                          ],) ,
                        ),
                      ), //6
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Sunday', style: weekdayStyle,),
                          Checkbox(
                            value: sunday,
                            onChanged: (value) {
                              if(!this.days.contains(6)){
                                this.days.add(6);
                              }
                              else{
                                this.days.remove(6);
                              }
                              setState(() {
                                sunday = value;
                              });
                            },

                          ),
                        ],
                      ),
                    ),), //7
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.blue,
              ),
              child: Builder(
                builder: (context) => FlatButton(
                  
                  onPressed: () {
                    timeFrom = showTimePicker(context: context, initialTime: TimeOfDay.now());
                  },
                  child: Text('Set Start Time', style: TextStyle(fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.blue,
              ),
              child: Builder(
                builder: (context) => FlatButton(
                  onPressed: () {timeto = showTimePicker(context: context, initialTime: TimeOfDay.now());},
                  child: Text("Set End Time", style: TextStyle(fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
            ),
            RaisedButton(
              
              elevation: 20,
              color: Colors.blue,
              onPressed: () {
                if( this.days.length > 0 && this.timeFrom != null && this.timeto != null) {
                  createCourse();
                  Navigator.pop(
                    context,
                    );
                }
              },
              child: Text('Add Course', style: TextStyle(fontFamily: 'Avenir', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),

            )
          ],
        ),
      ),
     ),
    );
  }

  void createCourse() async{
    for(int day in days) {
      print(day);
    }
    DateTime rightNow = new DateTime.now();
    DateTime timeStart;
    DateTime timeEnd;

    await timeFrom.then((value) => timeStart = new DateTime(rightNow.year, rightNow.month, rightNow.day, value.hour, value.minute));
    print(timeStart.toString());
    await timeto.then((value) => timeEnd = new DateTime(rightNow.year, rightNow.month, rightNow.day, value.hour, value.minute));
    print(timeto.toString());
    List<DateTime> times = [];
    times.add(timeStart);
    times.add(timeEnd);
    CourseType type;
    MyHomePage.theUser.createCourse(this.courseName, this.days, type , times, this.repeats);

  }

}
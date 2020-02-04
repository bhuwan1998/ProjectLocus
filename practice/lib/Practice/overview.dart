import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';




class  Overview extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue),
      home: HomePage(),

    );

  }
}



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
  }
  
  class _HomePageState extends State<HomePage> {
    CalendarController _controller;
    @override
    void initState(){
      super.initState();
      _controller = CalendarController();

    }


    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Flutter Calendar')),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
            height: 500,
            width: 400,
            child: Column(
            
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                // changing the color of the day selected by the user 
                initialCalendarFormat: CalendarFormat.week,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.black,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.8, color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                  formatButtonShowsNext: false,
                ),
                calendarController: _controller,),
            SizedBox(height: 20,),
            
            

            
                ],
            
              ),
          
           ),
          ),
         ),
      );
    }
}
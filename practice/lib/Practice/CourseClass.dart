import 'dart:collection';
import 'package:practice/Practice/Occurrence.dart';
import 'CourseType.dart';


// Name, type, occurrence
class Courses{  
  // List of occurrences 
  List<Occurrence> occurrences; 
  String courseNameNum = ""; //courseName and number 
  CourseType type;


  Courses(String courseNameNum, CourseType type){ // constructor for the course class
    this.courseNameNum = courseNameNum;
    this.type = type;
  }

  void setNameOfCourse(String nameOfCourse){
  this.courseNameNum = nameOfCourse;    // here we set the name of the course 
}
  
  String getNameOfCourse() {
    return this.courseNameNum;
  }

  void removeOccurrenceByDay(int day){
    for(Occurrence occurs in this.occurrences){
      if(occurs.daysPerWeek.contains(day)){
        occurs.daysPerWeek.remove(day);
      }
    }
  }

  void addTimeOfCourse(List<int> daysPerWeek, List<DateTime> time, bool repeats){
    for(Occurrence occurs in this.occurrences){
     
    }
    this.occurrences.add(new Occurrence(daysPerWeek, time, repeats));
  }



}








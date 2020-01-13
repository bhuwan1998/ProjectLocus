import 'dart:collection';
import 'package:practice/Practice/Occurrence.dart';
import 'CourseType.dart';


// Name, type, occurrence
class Courses{

  List<Occurrence> occurrences;
  String courseNameNum = "";
  CourseType type;


  Courses(String courseNameNum, CourseType type){
    this.courseNameNum = courseNameNum;
    this.type = type;
  }

  void setNameOfCourse(String nameOfCourse){
  this.courseNameNum = nameOfCourse;
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








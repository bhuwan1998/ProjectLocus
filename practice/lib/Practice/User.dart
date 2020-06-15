import 'package:practice/Practice/CourseClass.dart';
import 'package:practice/Practice/CourseType.dart';


class User {
  List<Courses> courses = []; // a list of courses which is expandable
  

  void createCourse(String courseName, List<int> daysPerWeek, CourseType type, List<DateTime> time, bool repeats){
    if(this.getCourseByName(courseName) == null) {
      this.courses.add(new Courses(courseName, type) );
    }
  }

  Courses getCourseByName(String courseName){
    for(Courses course in this.courses){
      if(course.courseNameNum == courseName){
        return course;
      }
    }
    return null;
  }
  
}
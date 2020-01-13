
class Occurrence {
  // for courses that repeat or lectures 
  List<int> daysPerWeek;
  List<DateTime> time;
  bool repeats = false;

  //constructor 
  Occurrence(List<int> daysPerWeek, List<DateTime> time, bool repeats){
    this.daysPerWeek = daysPerWeek;
    this.time = time;
    this.repeats = repeats;
  }

}
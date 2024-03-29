import './user.dart';
import './datetime.dart';
import '../api/user.dart';

class PassModel {
  int pk;
  bool approved;
  DateTime date;
  Duration startTimeRequested, endTimeRequested, timeLeftOrigin, timeArrivedDestination;
  UserModel student, originTeacher;
  String description;
  String type;
  
  PassModel(
    this.pk, 
    this.approved, 
    this.date,
    this.startTimeRequested, 
    this.endTimeRequested, 
    this.timeLeftOrigin, 
    this.timeArrivedDestination, 
    this.student, 
    this.originTeacher, 
    this.description, 
    this.type
  );

  static PassModel testModel() {
    return PassModel(
      0, 
      true, 
      MyDateTime.now(),
      MyDateTime.now(),
      MyDateTime.now(),
      MyDateTime.now(),
      MyDateTime.now(),
      UserModel.testModel(), 
      UserModel.testModel(), 
      "Description", 
      "SRTPass"
    );
  }


  PassModel.fromJson(Map<String, dynamic> json): 
    pk = json['pk'],
    approved = json['approved'],
    date = DateTime.parse(json['date']),
    startTimeRequested = parseTime(json['startTimeRequested']),
    endTimeRequested = parseTime(json['endTimeRequested']),
    timeLeftOrigin = parseTime(json['timeLeftOrigin']),
    timeArrivedDestination = parseTime(json['timeArrivedDestination']),
    student = UserModel.fromJson(json['student'], null),
    originTeacher = UserModel.fromJson(json['originTeacher'], null),
    description = json['description'], 
    type = json['type'];

  String getDate() {
    return getMonthName(date.month) + " " + date.day.toString() + ", " + date.year.toString();
  }

  String getDuration() {
    return getTime(startTimeRequested) + "-" + getTime(endTimeRequested);
  }

  String getDateDuration() {
    return getDate() + ", " + getDuration();
  }

  String getTime(Duration duration) {
    return duration.inHours.toString() + ":" + (duration.inMinutes%60).toString();
  }

  String getMonthName(int month) {
    switch(month) {
      case 1:
        return "January";
      case 2:
        return "Feburary";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
  }


  static Duration parseTime(String time) {
    Duration parsedTime;
    if (time != null) {
      List<String> parts = time.split(":");
      parsedTime =  Duration(
        hours: int.parse(parts.elementAt(0)), 
        minutes: int.parse(parts.elementAt(1)),
        seconds: double.parse(parts.elementAt(2)).toInt()
      );
    } else {
      parsedTime = null;
    }
    return parsedTime;
  }
}
import './user.dart';
import './datetime.dart';
import '../api/user.dart';

class PassModel {
  int pk;
  bool approved;
  DateTime date;
  Duration startTimeRequested, endTimeRequested, timeLeftOrigin, timeArrivedDestination;
  int studentId, originTeacherId;
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
    studentId = json['student'],
    originTeacherId = json['originTeacher'],
    description = json['description'], 
    type = json['type'];
    
  void fillUsers(String token) async {
    student = await UserAPI().getData(token, studentId);
    originTeacher = await UserAPI().getData(token, originTeacherId);
  }

  String getDate() {
    return date.toString();
  }

  String getDuration() {
    return this.startTimeRequested.toString() + "-" + this.endTimeRequested.toString();
  }

  String getDateDuration() {
    return getDate() + ", " + getDuration();
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
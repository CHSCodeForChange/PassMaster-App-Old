import './user.dart';
import './datetime.dart';

class PassModel {
  int pk;
  bool approved;
  MyDateTime date, startTimeRequested, endTimeRequested, timeLeftOrigin, timeArrivedDestination;
  UserModel student, originTeacher;
  String description;
  
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
    this.description
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
      "Description"
    );
  }

  String getDate() {
    return this.date.getDate();
  }

  String getDuration() {
    return this.startTimeRequested.getTime() + "-" + this.endTimeRequested.getTime();
  }

  String getDateDuration() {
    return getDate() + ", " + getDuration();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../fragments/dropdown.dart';
import './add/teacher.dart';
import './add/srt.dart';
import './add/location.dart';

class Add extends StatefulWidget {

  @override
  AddState createState() => new AddState();
}

class AddState extends State<Add> {

  int value = 0;

  void function (int value) {
    setState(() {
      this.value = value;
    });
    print(this.value);
  }

  Widget getForm() {
    switch(value) {
      case 0:
        return TeacherPassForm();
      case 1: 
        return LocationPassForm();
      case 2: 
        return SRTPassForm();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      child: new Column(
        children: <Widget>[
          new Container(
            width: double.infinity,
            child: new Container(
              margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: new Dropdown(["Teacher", "Location", "SRT"], function)
            ),
          ),
          new Expanded(
            child: new Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: new Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: getForm()
                )
              ),
            )
          ),
          new Container(
            margin: EdgeInsets.only(bottom:20.0),
            width: 325.0,
            child: new RaisedButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: new Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
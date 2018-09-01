import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../fragments/dropdown.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
      child: new Column(
        children: <Widget>[
          new Container(
            width: double.infinity,
            child: new Container(
              margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: new Dropdown(["Teacher", "Location", "SRT"])
            ),
          )
        ],
      ),
    );
  }
}
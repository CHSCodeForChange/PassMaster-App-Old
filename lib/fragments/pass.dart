import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/pass.dart';

class Pass extends StatelessWidget {
  PassModel pass;

  Pass(this.pass);

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: new Container(
        height: 500.0, // force card to take up full space
        width: 500.0, 
        padding: EdgeInsets.all(25.0),
        // alignment: AlignmentDirectional.topStart,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                this.pass.student.getName(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            new Container(
              child: new Text(
                this.pass.getDateDuration(),
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
            ),
            new Container(
              child: new Text(
                this.pass.description,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
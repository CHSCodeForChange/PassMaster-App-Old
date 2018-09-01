import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dropdown extends StatefulWidget {
  List<String> strings = [];

  Dropdown(this.strings);

  @override
  DropdownState createState() => new DropdownState(this.strings);
}

class DropdownState extends State<Dropdown> {
  int value = 0;
  List<DropdownMenuItem> types = [];

  DropdownState (List<String> strings) {
    for (int i = 0; i < strings.length; i++) {
      types.add(
        new DropdownMenuItem(
          child: new Text(
            strings[i],
            textAlign: TextAlign.center,
          ),
          value: i,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: new DropdownButton(
          items: this.types,
          value: this.value,
          onChanged: (value) {
            setState(() {
              this.value = value; 
            });
          },
        )
      )
    );
  }
}
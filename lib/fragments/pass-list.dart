import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './pass-mini.dart';
import '../models/pass.dart';

class PassList extends StatefulWidget {
  Iterable<PassModel> passes;

  PassList(this.passes);

  @override
  PassListState createState() => new PassListState(passes); 
}

class PassListState extends State<PassList> {
  Iterable<PassModel> passes;

  PassListState(this.passes);


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: 100.0,
      itemCount: passes != null ? passes.length : 0,
      itemBuilder: (BuildContext context, int index) {
        return new PassMini(passes.elementAt(index));
      },
    );
  }
}
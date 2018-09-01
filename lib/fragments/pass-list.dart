import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './pass-mini.dart';
import '../models/pass.dart';

class PassList extends StatelessWidget {
  PassList();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemExtent: 100.0,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return new PassMini(PassModel.testModel());
      },
    );
  }
}
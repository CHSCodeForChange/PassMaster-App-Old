import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dropdown extends StatelessWidget {

  List<DropdownMenuItem> types = [];

  Dropdown (List<String> strings) {
    for (String string in strings) {
      types.add(
        new DropdownMenuItem(
          child: new Text(
            string,
            textAlign: TextAlign.center,
          )
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new DropdownButton(
      
      items: this.types,
    );
  }
}
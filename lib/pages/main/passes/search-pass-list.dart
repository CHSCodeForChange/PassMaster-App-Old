import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../fragments/pass-list.dart';
import '../../../fragments/search-filters.dart';
import '../../../models/pass.dart';

class SearchPassList extends StatelessWidget {
  PassModel pass;

  SearchPassList();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(top:10.0, right: 10.0, left: 10.0),
            child: SearchFilters(),
          ),
          new Expanded(
            child: new PassList(),
          )
        ],
      )
    );
  }
}
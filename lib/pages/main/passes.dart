import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './passes/current-passes.dart';
import './passes/unapproved-passes.dart';
import './passes/search-pass-list.dart';

class Passes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top:20.0),
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(text: 'Current'),
              Tab(text: 'Unapproved'),
            ],
          ),
          backgroundColor: Colors.orangeAccent,

          body: TabBarView(
            children: [
              new SearchPassList(),
              new CurrentPasses(),
              new UnapprovedPasses(),
            ],
          ),
        ),
      ),
    );
  }
}
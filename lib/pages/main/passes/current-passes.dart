import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import '../../../fragments/pass-list.dart';
import '../../../api/pass_list.dart';
import '../../../models/pass.dart';
import '../../../models/user.dart';

class CurrentPasses extends StatefulWidget {
  UserModel user;

  CurrentPasses(this.user);

  @override
  CurrentPassesState createState() => new CurrentPassesState(user);

}

class CurrentPassesState extends State<CurrentPasses> {
  UserModel user;
  PassList list;

  CurrentPassesState(this.user);

  @override 
  void initState() {
    getData();
    list = new PassList(null);
  }

  Future<void> getData() async {
    Iterable<PassModel> passes = await PassListAPI().getData(user.token);
    list.state.setState(() {
      list.state.passes = passes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return list;
  }
}
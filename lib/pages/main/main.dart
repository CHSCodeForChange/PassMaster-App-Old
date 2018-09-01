import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import './add.dart';
import './home.dart';
import './passes.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() => new MainState();

}

class MainState extends State<Main> {

  List pages = [
    new Add(),
    new Home(),
    new Passes()
  ];

  int index = 1;

  void onTabTapped(int index) {
    setState(() {
      this.index = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orangeAccent,
        currentIndex: index, 
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add),
            title: new Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Passes')
          )
        ],
      ),

      body: pages[index],
    );
  }
}
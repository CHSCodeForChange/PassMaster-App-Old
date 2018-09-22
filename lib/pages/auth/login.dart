import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main/main.dart';
import './signup.dart';
import '../../api/login.dart';
import '../../models/user.dart';

class Login extends StatelessWidget {

  void login(BuildContext context) async {
    UserModel user = await LoginAPI().getData("student", "student1");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Main(user)),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.orangeAccent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Text(
              'PassMaster',
              style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
            )
          ),
          new Container(
            margin: EdgeInsets.all(20.0),
            child: new Form(
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Username'
                      ),
                    )
                  ), 
                  new Container(
                    margin: EdgeInsets.all(10.0),
                    child: new TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password'
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.all(5.0),
                  child: new RaisedButton(
                    onPressed: () {
                      login(context);  
                    },
                    child: new Text('Login'),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.all(5.0),
                  child: new RaisedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: new Text('Sign Up'),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            child: new Text(
              'Code For Change 2018',
              style: TextStyle(color: Colors.white),
            )
          )
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:async';

@immutable
class MyUser {
  final String name;

  MyUser(this.name);
}

class l_login_dialog extends StatefulWidget {
  @override
  l_login_dialog_state createState() => new l_login_dialog_state();
}

class l_login_dialog_state extends State<l_login_dialog> {
  Future<MyUser> user;

  void _logIn() {
    setState(() {
      user = new Future.delayed(
        const Duration(seconds: 3),
        () {
          return new MyUser("Toto");
        },
      );
    });
  }

  Widget _buildForm(AsyncSnapshot<MyUser> snapshot) {
    var floatBtn = new RaisedButton(
      onPressed: snapshot.connectionState == ConnectionState.none ? _logIn : null,
      child: new Icon(Icons.save),
    );
    var action = snapshot.connectionState != ConnectionState.none && !snapshot.hasData
            ? new Stack(
                alignment: FractionalOffset.center,
                children: <Widget>[
                  floatBtn,
                  new CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                ],
              )
            : floatBtn;

    return new ListView(
      padding: const EdgeInsets.all(15.0),
      children: <Widget>[
        new ListTile(
          title: new TextField(),
        ),
        new ListTile(
          title: new TextField(obscureText: true),
        ),
        new Center(child: action)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: user,
      builder: (context, AsyncSnapshot<MyUser> snapshot) {
        if (snapshot.hasData) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Hello ${snapshot.data.name}"),
            ),
          );
        } else {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Connection"),
            ),
            body: _buildForm(snapshot),
          );
        }
      },
    );
  }
}

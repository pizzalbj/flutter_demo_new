import 'package:flutter/material.dart';

class n_bottom_sheet extends StatefulWidget {
  @override
  n_bottom_sheetState createState() => new n_bottom_sheetState();
}

class n_bottom_sheetState extends State<n_bottom_sheet> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet(
          (context) {
            return new Container(
              height: 300.0,
              color: Colors.greenAccent,
              child: new Column(
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new Center(
                    child: new Text("Hi BottomSheet"),
                  ),
                ],
              ),
            );
          },
        )
        .closed
        .whenComplete(
          () {
            if (mounted) {
              setState(() {
                _showPersBottomSheetCallBack = _showBottomSheet;
              });
            }
          },
        );
  }

  void _showModalSheet() {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 40.0,
          color: Colors.greenAccent,
          child: new Center(
            child: new Text("Hi ModalSheet"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Flutter BottomSheet"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: _showPersBottomSheetCallBack,
              child: new Text("Persistent"),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new RaisedButton(
              onPressed: _showModalSheet,
              child: new Text("Modal"),
            ),
          ],
        )),
      ),
    );
  }
}

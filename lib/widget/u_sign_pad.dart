//import 'dart:async';
//import 'package:flutter/material.dart';
//import 'package:signature_pad/signature_pad.dart';
//import 'package:signature_pad_flutter/signature_pad_flutter.dart';
//
//class SignaturePadExample extends StatefulWidget {
//  State<StatefulWidget> createState() {
//    return new SignaturePadExampleState();
//  }
//}
//
//class SignaturePadExampleState extends State<SignaturePadExample> {
//  SignaturePadController _padController;
//
//  void initState() {
//    super.initState();
//    _padController = new SignaturePadController();
//  }
//
//  Widget build(BuildContext context) {
//    var signaturePad = new SignaturePadWidget(
//      _padController,
//      new SignaturePadOptions(
//          dotSize: 5.0,
//          minWidth: 1.0,
//          maxWidth: 4.0,
//          penColor: "#000000",
//          signatureText: "Signed by Ringo Starr on Jan 1, 1962"),
//    );
//    return new Container(
//      child: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              new Expanded(
//                child: new Container(
//                  height: 200.0,
//                  child: new Center(
//                    child: new AspectRatio(
//                      aspectRatio: 3.0 / 1.0,
//                      child: new Container(
//                        decoration: new BoxDecoration(
//                          color: Colors.white,
//                          border: new Border.all(),
//                        ),
//                        child: signaturePad,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          Padding(
//            padding: const EdgeInsets.only(top: 8.0),
//            child: new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                new RaisedButton(
//                  onPressed: _handleClear,
//                  child: new Text("Clear"),
//                  color: Colors.white,
//                  textColor: Colors.black,
//                ),
//                new RaisedButton(
//                  onPressed: _handleSavePng,
//                  child: new Text("Save as PNG"),
//                  color: Colors.white,
//                  textColor: Colors.black,
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  void _handleClear() {
//    _padController.clear();
//  }
//
//  Future _handleSavePng() async {
//    var result = await _padController.toPng();
//    Navigator.of(context).push(
//      new MaterialPageRoute(
//        builder: (BuildContext context) {
//          return new Scaffold(
//            appBar: new AppBar(
//              backgroundColor: Colors.grey[700],
//            ),
//            backgroundColor: Colors.grey[300],
//            body: new Center(
//              child: new Container(
//                decoration: new BoxDecoration(
//                  border: new Border.all(),
//                  color: Colors.white,
//                ),
//                padding: new EdgeInsets.all(4.0),
//                margin: new EdgeInsets.all(4.0),
//                child: new Image.memory(result),
//              ),
//            ),
//          );
//        },
//        fullscreenDialog: true,
//      ),
//    );
//  }
//}
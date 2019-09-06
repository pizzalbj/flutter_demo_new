import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExamplePageState();
}

class ExamplePageState extends State<ExamplePage> {


  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didUpdateWidget (){
  //   super.didUpdateWidget(oldWidget)
  //
  // }

  int count = 0;
  int countTwo = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(count.toString()),
            new Text(countTwo.toString()),
            new RaisedButton(
              child: new Text("count ++"),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormEG extends StatefulWidget {
  @override
  _FormEGState createState() => new _FormEGState();
}

class _FormEGState extends State<FormEG> {
  List<String> _listValues;
  List<DropdownMenuItem<String>> _items;
  List<Widget> _widgets;

  @override
  void initState() {
    _listValues = new List<String>();
    setDefaults();
    setWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("built");
    return new Scaffold(
        body: new ListView.builder(
          itemCount: _widgets.length,
          itemBuilder: (context, index) {
            return _widgets[index];
          },
        ));
  }

  void setDefaults() {
    _listValues.add("b");
  }

  void setWidgets() {
    setMenuItems();
    _widgets = new List<Widget>();
    _widgets.add(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new DropdownButton<String>(
            value: _listValues[0],
            items: _items,
            onChanged: (String newValue) {
              setState(() {
                _listValues[0] = newValue;
              });
            },
          );
        },
      ),
    );
  }

  void setMenuItems() {
    _items = new List<DropdownMenuItem<String>>();
    _items.add(new DropdownMenuItem(child: Text("a"), value: "a"));
    _items.add(new DropdownMenuItem(child: Text("b"), value: "b"));
    _items.add(new DropdownMenuItem(child: Text("c"), value: "c"));
    _items.add(new DropdownMenuItem(child: Text("d"), value: "d"));
  }
}
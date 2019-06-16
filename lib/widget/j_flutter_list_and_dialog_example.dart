// https://insertbreakpoint.wordpress.com/2018/03/28/flutter-list-dialog-example/
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:numberpicker/numberpicker.dart';

class flutter_list_and_dialog_example extends StatefulWidget {
  @override
  flutter_list_and_dialog_exampleState createState() =>
      new flutter_list_and_dialog_exampleState();
}

class ModelData {
  String text;
  int number;

  ModelData(this.text, this.number);

  ModelData.empty() {
    text = "";
    number = 0;
  }
}

class flutter_list_and_dialog_exampleState
    extends State<flutter_list_and_dialog_example> {
  List _items = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("nihao"),
      ),
      body: new ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add Item',
        child: new Icon(Icons.add),
        onPressed: () => _openDialogAddItem(),
      ),
    );
  }

  Widget getRow(int position) {
    return new FlatButton(
      child: new ListTile(
        title: new Text(_items[position].text),
        trailing: new Text(_items[position].number.toString()),
      ),
      onPressed: () {
        setState(() {
          _items.removeAt(position);
        });
      },
    );
  }

  Future _openDialogAddItem() async {
    ModelData data = await Navigator.of(context).push(
          new MaterialPageRoute<ModelData>(
            builder: (BuildContext context) {
              return new DialogAddItem();
            },
            fullscreenDialog: true,
          ),
        );

    if (data != null) {
      setState(() {
        _items.add(data);
      });
    } else {
      print("null");
    }
  }
}

class DialogAddItem extends StatefulWidget {
  @override
  _DialogAddItemState createState() => new _DialogAddItemState();
}

class _DialogAddItemState extends State<DialogAddItem> {
  bool _canSave = false;
  ModelData _data = new ModelData.empty();

  void _setCanSave(bool save) {
    if (save != _canSave) setState(() => _canSave = save);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Add New Item'),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              'ADD',
              style: new TextStyle(color: _canSave ? Colors.red : Colors.white),
            ),
            onPressed: _canSave
                ? () {
                    Navigator.of(context).pop(_data);
                  }
                : null,
          ),
        ],
      ),
      body: new Form(
        child: new ListView(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          children: <Widget>[
            new TextField(
              decoration: const InputDecoration(
                labelText: "Text",
              ),
              onChanged: (String value) {
                _data.text = value;
                _setCanSave(value.isNotEmpty);
              },
            ),
            new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
              child: new NumberPicker.integer(
                initialValue: _data.number,
                minValue: 0,
                maxValue: 100,
                onChanged: (newValue) =>
                    setState(() => _data.number = newValue),
              ),
            )
          ].toList(),
        ),
      ),
    );
  }
}


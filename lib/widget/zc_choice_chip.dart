import 'package:flutter/material.dart';

class MyThreeOptions extends StatefulWidget {
  @override
  _MyThreeOptionsState createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Wrap(
        children: List<Widget>.generate(
          3,
          (int index) {
            return ChoiceChip(
              label: Text('Item $index'),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

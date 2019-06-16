import 'package:flutter/material.dart';

class ExampleTwo extends StatefulWidget {
  ExampleTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExampleTwoState createState() => new _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildMainContent(),
    );
  }

  _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 126.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Title'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
          ]),
        )
      ],
    );
  }

  Widget _buildListItem() {
    return Column(
      children: <Widget>[
        Container(
          // padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          decoration: new BoxDecoration(
            color: Colors.red,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'List header',
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.yellow,
          ),
          child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.all(0.0),
//             padding: EdgeInsets.only(top: 8.0),
            // padding 这里不设置的话，上下会有padding
            itemBuilder: (context, index) {
              return Container(
                decoration: new BoxDecoration(
                  color: Colors.green,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Text(
                  'Nested list item $index',
                  style: Theme.of(context).textTheme.body1,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'bloc_provider.dart';

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Streams Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// 实例化一个新的 BlocProvider，它将处理一个 IncrementBloc
      /// 通过这些代码，我们只需实例化一个新的 BlocProvider，它将处理一个 IncrementBloc，并将 CounterPage 作为子项呈现。
      /// BlocProvider 子树的任何小部件部分都将能够通过以下代码访问 IncrementBloc
      /// IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: CounterSecPage(),
      ),
    );
  }
}

class CounterSecPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.outCounter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} times');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}

class IncrementBloc implements BlocBase {
  int _counter;

  //
  // Stream来处理计数器
  //
  StreamController<int> _counterController = StreamController<int>();

  StreamSink<int> get _inAdd => _counterController.sink;

  Stream<int> get outCounter => _counterController.stream;

  //
  //  Stream来处理计数器上的操作
  //
  StreamController _actionController = StreamController();

  StreamSink get incrementCounter => _actionController.sink;

  //
  // Constructor
  //
  IncrementBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void dispose() {
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }
}

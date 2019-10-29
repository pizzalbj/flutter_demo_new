import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo_new/widget/rxdart_and_pull_to_refresh/blocs/bloc_provider.dart';

class ApplicationBloc implements BlocBase {
  // BehaviorSubject:
  // A special StreamController that captures the latest item that has been added to the controller,
  // and emits that as the first item to any new listener.
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();

  // Sink:
  // A generic destination for data.
  // Multiple data values can be put into a sink, and when no more data is available, the sink should be closed.
  // This is a generic interface that other data receivers can implement.
  Sink<int> get _appEventSink => _appEvent.sink;

  // Stream:
  // A source of asynchronous data events.
  // A Stream provides a way to receive a sequence of events.
  Stream<int> get appEventStream => _appEvent.stream;

  void sendAppEvent(int type) {
    _appEventSink.add(type);
  }

  @override
  void dispose() {}

  @override
  Future getData({String labelId, int page}) {
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return null;
  }
}

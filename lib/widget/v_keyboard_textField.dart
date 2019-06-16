import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  FocusNode _focusNodeFirstName = new FocusNode();
  FocusNode _focusNodeLastName = new FocusNode();
  FocusNode _focusNodeDescription = new FocusNode();
  static final TextEditingController _firstNameController =
      new TextEditingController();
  static final TextEditingController _lastNameController =
      new TextEditingController();
  static final TextEditingController _descriptionController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNodeFirstName.addListener(_focusNodeFirstListener);
    _focusNodeLastName.addListener(_focusNodeLastListener);
    _focusNodeDescription.addListener(_focusNodeDesListener);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeFirstName.removeListener(_focusNodeFirstListener);
    _focusNodeLastName.removeListener(_focusNodeLastListener);
    _focusNodeDescription.removeListener(_focusNodeDesListener);
    WidgetsBinding.instance.removeObserver(this);
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  ///
  @override
  void didChangeMetrics() {}

  Future<Null> _focusNodeFirstListener() async {
    if (_focusNodeFirstName.hasFocus) {
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  Future<Null> _focusNodeLastListener() async {
    if (_focusNodeLastName.hasFocus) {
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  Future<Null> _focusNodeDesListener() async {
    if (_focusNodeDescription.hasFocus) {
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Test Page'),
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: _formKey,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                /* -- Something large -- */
                Container(
                  width: double.infinity,
                  height: 150.0,
                  color: Colors.red,
                ),

                /* -- First Name -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeFirstName,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first name',
                      labelText: 'First name *',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    controller: _firstNameController,
                    focusNode: _focusNodeFirstName,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Last Name -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeLastName,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your last name',
                      labelText: 'Last name *',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    controller: _lastNameController,
                    focusNode: _focusNodeLastName,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Some other fields -- */
                new Container(
                  width: double.infinity,
                  height: 250.0,
                  color: Colors.blue,
                ),

                /* -- Description -- */
                new EnsureVisibleWhenFocused(
                  focusNode: _focusNodeDescription,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Tell us about yourself',
                      labelText: 'Describe yourself',
                    ),
                    onSaved: (String value) {
                      //TODO
                    },
                    maxLines: 5,
                    controller: _descriptionController,
                    focusNode: _focusNodeDescription,
                  ),
                ),
                const SizedBox(height: 24.0),

                /* -- Save Button -- */
                new Center(
                  child: new RaisedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Helper class that ensures a Widget is visible when it has the focus
/// For example, for a TextFormField when the keyboard is displayed
///
/// How to use it:
///
/// In the class that implements the Form,
///   Instantiate a FocusNode
///   FocusNode _focusNode = new FocusNode();
///
/// In the build(BuildContext context), wrap the TextFormField as follows:
///
///   new EnsureVisibleWhenFocused(
///     focusNode: _focusNode,
///     child: new TextFormField(
///       ...
///       focusNode: _focusNode,
///     ),
///   ),
///
/// Initial source code written by Collin Jackson.
/// Extended (see highlighting) to cover the case when the keyboard is dismissed and the
/// user clicks the TextFormField/TextField which still has the focus.
///
class EnsureVisibleWhenFocused extends StatefulWidget {
  const EnsureVisibleWhenFocused({
    Key key,
    @required this.child,
    @required this.focusNode,
    this.curve: Curves.ease,
    this.duration: const Duration(milliseconds: 100),
  }) : super(key: key);

  /// The node we will monitor to determine if the child is focused
  final FocusNode focusNode;

  /// The child widget that we are wrapping
  final Widget child;

  /// The curve we will use to scroll ourselves into view.
  ///
  /// Defaults to Curves.ease.
  final Curve curve;

  /// The duration we will use to scroll ourselves into view
  ///
  /// Defaults to 100 milliseconds.
  final Duration duration;

  @override
  _EnsureVisibleWhenFocusedState createState() =>
      new _EnsureVisibleWhenFocusedState();
}

///
/// We implement the WidgetsBindingObserver to be notified of any change to the window metrics
///
class _EnsureVisibleWhenFocusedState extends State<EnsureVisibleWhenFocused>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_ensureVisible);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode.removeListener(_ensureVisible);
    super.dispose();
  }

  ///
  /// This routine is invoked when the window metrics have changed.
  /// This happens when the keyboard is open or dismissed, among others.
  /// It is the opportunity to check if the field has the focus
  /// and to ensure it is fully visible in the viewport when
  /// the keyboard is displayed
  ///
  @override
  void didChangeMetrics() {
    if (widget.focusNode.hasFocus) {
      _ensureVisible();
    }
  }

  ///
  /// This routine waits for the keyboard to come into view.
  /// In order to prevent some issues if the Widget is dismissed in the
  /// middle of the loop, we need to check the "mounted" property
  ///
  /// This method was suggested by Peter Yuen (see discussion).
  ///
  Future<Null> _keyboardToggled() async {
    if (mounted) {
      EdgeInsets edgeInsets = MediaQuery.of(context).viewInsets;
      while (mounted && MediaQuery.of(context).viewInsets == edgeInsets) {
        await new Future.delayed(const Duration(milliseconds: 10));
      }
    }

    return;
  }

  Future<Null> _ensureVisible() async {
    // Wait for the keyboard to come into view
    await Future.any([
      new Future.delayed(const Duration(milliseconds: 300)),
      _keyboardToggled()
    ]);

    // No need to go any further if the node has not the focus
    if (!widget.focusNode.hasFocus) {
      return;
    }

    // Find the object which has the focus
    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);

    // If we are not working in a Scrollable, skip this routine
    if (viewport == null) {
      return;
    }

    // Get the Scrollable state (in order to retrieve its offset)
    ScrollableState scrollableState = Scrollable.of(context);
    assert(scrollableState != null);

    // Get its offset
    ScrollPosition position = scrollableState.position;
    double alignment;

    if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
      // Move down to the top of the viewport
      alignment = 0.0;
    } else if (position.pixels <
        viewport.getOffsetToReveal(object, 1.0).offset) {
      // Move up to the bottom of the viewport
      alignment = 1.0;
    } else {
      // No scrolling is necessary to reveal the child
      return;
    }

    position.ensureVisible(
      object,
      alignment: alignment,
      duration: widget.duration,
      curve: widget.curve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

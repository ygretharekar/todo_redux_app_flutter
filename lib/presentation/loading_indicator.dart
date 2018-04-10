import 'package:flutter/material.dart';
import 'package:todo_redux_app/keys/keys.dart';

class LoadingIndicator extends StatelessWidget {
  LoadingIndicator({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Loading"),
    );
  }
}
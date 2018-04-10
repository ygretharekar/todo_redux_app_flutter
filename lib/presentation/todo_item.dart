import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;

  TodoItem(this.onDismissed, this.onTap);


  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
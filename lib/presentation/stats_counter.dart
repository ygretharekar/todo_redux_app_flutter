import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/containers/app_loading.dart';
import 'loading_indicator.dart';

class StatsCounter extends StatelessWidget {
  final int numActive;
  final int numCompleted;

  StatsCounter({
    @required this.numActive,
    @required this.numCompleted
  });

  @override
  Widget build(BuildContext context) {
    return new AppLoading(
        builder: null
    );
  }

  Widget _buildStats(BuildContext context){
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
              padding: new EdgeInsets.only(bottom:  8.0),
              child: new Text(
                'Completed Todos',
                style: Theme.of(context).textTheme.title,
              )
          ),
          new Padding(
              padding: new EdgeInsets.only(bottom:  24.0),
              child: new Text(
                '$numCompleted',
                style: Theme.of(context).textTheme.subhead,
              )
          ),
          new Padding(
              padding: new EdgeInsets.only(bottom: 8.0),
              child: new Text(
                'Active Todos',
                style: Theme.of(context).textTheme.title,
              ),
          ),
          new Padding(
              padding: new EdgeInsets.only(bottom: 24.0),
              child: new Text(
                '$numActive',
                style: Theme.of(context).textTheme.subhead,
              ),
          ),
        ],
      ),
    );
  }

}
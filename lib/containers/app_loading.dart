import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';

class AppLoading extends StatelessWidget {
  final Function(BuildContext context, bool isLoading) builder;

  AppLoading({Key key, @required this.builder}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, bool>(
        distinct: true,
        builder: builder,
        converter: (Store<AppState> store) => store.state.isLoading
    );
  }
}
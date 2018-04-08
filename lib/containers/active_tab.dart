import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<AppTab> builder;


  ActiveTab({ Key key, @required this.builder}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return new StoreConnector<AppState, AppTab>(
        distinct: true,
        builder: builder,
        converter: (Store<AppState> store) => store.state.activeTab
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/selectors/selectors.dart';
import 'package:todo_redux_app/presentation/stats_counter.dart';

class Stats extends StatelessWidget {
  Stats({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        builder: (context, vm){
          return new StatsCounter(
              numActive: vm.numActive,
              numCompleted: vm.numCompleted
          );
        },
        converter: _ViewModel.fromStore
    );
  }
}

class _ViewModel {
  final int numCompleted;
  final int numActive;

  _ViewModel({
    @required this.numCompleted,
    @required this.numActive
  });

  static _ViewModel fromStore(Store<AppState> store){
    return new _ViewModel(
        numActive: numActiveSelector(todoSelector(store.state)),
        numCompleted: numCompletedSelector(todoSelector(store.state))
    );
  }
}
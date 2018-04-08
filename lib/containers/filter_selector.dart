import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/presentation/filter_button.dart';

class FilterSelector extends StatelessWidget {
  final bool visible;

  FilterSelector({Key key, @required this.visible}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new FilterButton(
            visible: visible,
            activeFilter: vm.activeFilter,
            onSelected: vm.onFilterSelected,
          );
        },
    );
  }
}

class _ViewModel {
  final Function(VisibilityFilter) onFilterSelected;
  final VisibilityFilter activeFilter;

  _ViewModel(
      {
        @required this.onFilterSelected,
        @required this.activeFilter
      }
  );

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        onFilterSelected: (filter) {
          store.dispatch(new UpdateFilterAction(filter));
        },
        activeFilter: store.state.activeFilter
    );
  }

}
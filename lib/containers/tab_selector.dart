import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/keys/keys.dart';

class TabSelector extends StatelessWidget {
  TabSelector({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return new BottomNavigationBar(
              key: Keys.tabs,
              currentIndex: AppTab.values.indexOf(vm.activeTab),
              onTap: vm.onTabSelected,
              items: AppTab.values.map(
                (tab) =>
                    new BottomNavigationBarItem(
                        icon: new Icon(
                          tab == AppTab.todos ? Icons.list : Icons.show_chart,
                            key: tab == AppTab.todos ?
                                Keys.todoTab:
                                Keys.statsTab
                        ),
                        title: new Text(
                          tab == AppTab.stats ?
                              'Stats':
                              'Todos'
                        )
                    )
              ).toList()
          );
        },
    );
  }
}

class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        activeTab: store.state.activeTab,
        onTabSelected: (index) {
          store.dispatch(new UpdateTabAction(AppTab.values[index]));
        }
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              activeTab == other.activeTab;

  @override
  int get hashCode =>
      activeTab.hashCode;

}
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/presentation/todo_list.dart';
import 'package:todo_redux_app/selectors/selectors.dart';

class FilteredTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreConnector<AppState, _ViewModel>(
        builder:
          (context, vm) {
            return  new TodoList(
                todos: vm.todos,
                onCheckboxChange: vm.onCheckboxChanged,
                onRemove: vm.onRemove,
                onUndoRemove: vm.onUndoRemove
            );
          }
        ,
        converter: _ViewModel.fromStore
    );
  }
}

class _ViewModel {
  final bool loading;
  final List<Todo> todos;
  final Function(Todo, bool) onCheckboxChanged;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;

  _ViewModel(
      {
        @required this.loading,
        @required this.todos,
        @required this.onCheckboxChanged,
        @required this.onRemove,
        @required this.onUndoRemove
      }
  );

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
        loading: store.state.isLoading,
        todos: filteredTodosSelector(
            todoSelector(store.state),
            activeFilterSelector(store.state)
        ),
        onCheckboxChanged: (todo, complete) {
          store.dispatch(
            new UpdateTodoAction(
                todo.id,
                todo.copyWith(complete: !todo.complete)
            )
          );
        },
        onRemove: (todo) {
          store.dispatch(
            new DeleteTodoAction(todo.id)
          );
        },
        onUndoRemove: (todo) {
          store.dispatch(
            new AddTodoAction(todo)
          );
        }
    );
  }
}
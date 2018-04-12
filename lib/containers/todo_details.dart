import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/selectors/selectors.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/presentation/details_screen.dart';

class TodoDetails extends StatelessWidget {
  final String id;

  TodoDetails({ Key key, @required this.id}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        ignoreChange: (state) => todosSelector(state.todos, id).isNotPresent,
        converter: (Store<AppState> store){
          return new _ViewModel.from(store, id);
        },
        builder: (context, vm){
          return new DetailsScreen(
              todo: vm.todo,
              onDelete: vm.onDelete,
              toggleCompleted: vm.toggleCompleted
          );
        }
    );
  }
}

class _ViewModel {
  final Todo todo;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  _ViewModel({
    @required this.todo,
    @required this.onDelete,
    @required this.toggleCompleted
  });

  factory _ViewModel.from(Store<AppState> store, String id){
    final todo = todosSelector(todoSelector(store.state), id).value;

    return _ViewModel(
        todo: todo,
        onDelete: () => store.dispatch(new DeleteTodoAction(todo.id)),
        toggleCompleted: (isCompleted) {
          store.dispatch(
            new UpdateTodoAction(
                todo.id,
                todo.copyWith(complete: isCompleted)
            )
          );
        }
    );
  }
}
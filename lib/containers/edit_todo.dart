import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/presentation/add_edit_screen.dart';
import 'package:todo_redux_app/keys/keys.dart';

class EditTodo extends StatelessWidget {
  final Todo todo;

  EditTodo({ Key key, this.todo}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new  StoreConnector<AppState, OnSaveCallback>(
        builder: (BuildContext context, OnSaveCallback onSave){
          return new AddEditScreen(
              key: Keys.editTodoScreen,
              isEditing: true,
              onSave: onSave,
              todo: todo,
          );
        },

        converter: (Store<AppState> store){
          return (task, note){
            store.dispatch(
              new UpdateTodoAction(
                  todo.id,
                  todo.copyWith(
                    task: task,
                    note: note
                  )
              )
            );
          };
        }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_redux_app/presentation/add_edit_screen.dart';
import 'package:todo_redux_app/keys/keys.dart';

class AddTodo extends StatelessWidget {

  AddTodo({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSaveCallback>(
        builder: (BuildContext context, OnSaveCallback onSave){
          return new AddEditScreen(
              key: Keys.addTodoScreen,
              isEditing: false,
              onSave: onSave
          );
        },

        converter: (Store<AppState> store){
          return (task, note) {
            store.dispatch(
              new AddTodoAction(
                new Todo(
                    task,
                    note: note,
                )
              )
            );
          };
        }
    );
  }
}
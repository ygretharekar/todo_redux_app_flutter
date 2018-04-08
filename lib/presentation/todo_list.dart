import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/presentation/loading_indicator.dart';
import 'package:todo_redux_app/containers/app_loading.dart';
import 'package:todo_redux_app/keys/keys.dart';

class TodoList extends StatelessWidget {

  final List<Todo> todos;
  final Function(Todo, bool) onCheckboxChange;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;


  TodoList(
      {
        Key key,
        @required this.todos,
        @required this.onCheckboxChange,
        @required this.onRemove,
        @required this.onUndoRemove
      }
  ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(
        builder: (context, loading) {
          return new LoadingIndicator(key: Keys.todosLoading);
        }
    );
  }

}
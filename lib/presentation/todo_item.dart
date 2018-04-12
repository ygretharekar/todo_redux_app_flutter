import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/keys/keys.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Todo todo;

  TodoItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.todo
  });

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
        key: Keys.todoItem(todo.id),
        onDismissed: onDismissed,
        child: new ListTile(
          onTap: onTap,
          leading: new Checkbox(
              key: Keys.todoItemCheckbox(todo.id),
              value: todo.complete,
              onChanged: onCheckboxChanged
          ),
          title: new Text(
            todo.task,
            key: Keys.todoItemTask(todo.id),
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: new Text(
            todo.note,
            key: Keys.todoItemNote(todo.id),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subhead,
          ),
        )
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/presentation/loading_indicator.dart';
import 'package:todo_redux_app/containers/app_loading.dart';
import 'package:todo_redux_app/keys/keys.dart';
import 'package:todo_redux_app/containers/todo_details.dart';
import 'package:todo_redux_app/presentation/todo_item.dart';

class TodoList extends StatelessWidget {

  final List<Todo> todos;
  final Function(Todo, bool) onCheckboxChanged;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;

  TodoList(
      {
        Key key,
        @required this.todos,
        @required this.onCheckboxChanged,
        @required this.onRemove,
        @required this.onUndoRemove
      }
  ): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(
        builder: (context, loading) {
          return loading ?
            new LoadingIndicator(key: Keys.todosLoading):
            _buildListView();
        }
    );
  }

  ListView _buildListView() =>
      new ListView.builder(
          key: Keys.todoList,
          itemCount:  todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];

            return new TodoItem(
                onDismissed: (complete){
                  _removeTodo(context, todo);
                },
                onTap: () => _onTodoTap(context, todo),
                onCheckboxChanged: (complete) {
                  onCheckboxChanged(todo, complete);
                },
                todo: todo
            );
          }
      );

  void _removeTodo(BuildContext context, Todo todo){
    onRemove(todo);

    Scaffold.of(context).showSnackBar(
      new SnackBar(
          duration: new Duration(seconds: 2),
          content: new Text(
            'Deleted Task: ${todo.task}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          action: new SnackBarAction(
              label: 'undo',
              onPressed: () => onUndoRemove(todo)
          ),
      )
    );
  }

  void _onTodoTap(BuildContext context, Todo todo){
    Navigator
      .of(context)
      .push(
        new MaterialPageRoute(
            builder: (_) => new TodoDetails(id: todo.id)
        )
      )
      .then(
        (removedTodo) {
          if(removedTodo != null){
            Scaffold
                .of(context)
                .showSnackBar(
                  new SnackBar(
                      key: Keys.snackbar,
                      duration: new Duration(seconds: 3),
                      content: new Text(
                        '${todo.task} is Deleted',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      action: new SnackBarAction(
                          label: 'Undo',
                          onPressed: (){
                            onUndoRemove(todo);
                          }
                      ),
                  )
                );
          }
        }
      );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/keys/keys.dart';
import 'package:todo_redux_app/containers/edit_todo.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;
  final Function onDelete;
  final Function(bool) toggleCompleted;

  DetailsScreen({
    Key key,
    @required this.todo,
    @required this.onDelete,
    @required this.toggleCompleted
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo Details'),
        actions: <Widget>[
          new IconButton(
              tooltip: 'Delete Todo',
              key: Keys.deleteTodoButton,
              icon: new Icon(Icons.delete_forever),
              onPressed: () {
                onDelete();
                Navigator.pop(context, todo);
              }
          )
        ],
      ),
      body: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new ListView(
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.only(right: 8.0),
                  child: new Checkbox(
                      value: todo.complete,
                      onChanged: toggleCompleted
                  ),
              ),
              new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.only(
                            top: 8.0,
                            bottom: 16.0
                          ),
                          child: new Text(
                            todo.task,
                            key: Keys.detailsTodoItemTask,
                            style: Theme.of(context).textTheme.headline,
                          ),
                      ),
                      new Text(
                        todo.note,
                        key: Keys.detailsTodoItemNote,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  )
              )
            ],
          ),
      ),
      floatingActionButton: new FloatingActionButton(
          key: Keys.editTodoFab,
          tooltip: 'Edit Todo',
          child: new Icon(Icons.edit),
          onPressed: (){
            Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (context){
                    return new EditTodo(
                      todo: todo,
                    );
                  }
              )
            );
          },
      ),
    );
    
  }
}

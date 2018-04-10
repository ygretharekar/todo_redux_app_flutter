import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/keys/keys.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _taskKey =
      new GlobalKey<FormFieldState<String>>();

  static final GlobalKey<FormFieldState<String>> _noteKey =
      new GlobalKey<FormFieldState<String>>();

  final bool isEditing;
  final Function(String, String) onSave;
  final Todo todo;


  AddEditScreen({
    Key key,
    @required this.isEditing,
    @required this.onSave,
    this.todo
  }):super(key: key ?? Keys.addTodoScreen);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          isEditing ? 'Edit Todo': 'Add Todo'
        ),
      ),
      body: new Padding(
          padding: new EdgeInsets.all(16.0),
          child: new Form(
              key: _formKey,
              child: new ListView(
                children: <Widget>[
                  new TextFormField(
                    initialValue: isEditing ? todo.task:'',
                    key: _taskKey,
                    autofocus: !isEditing,
                    decoration: new InputDecoration(
                      hintText: 'Task name'
                    ),
                    validator: (val) =>
                        val.trim().isEmpty ?
                            'Please Enter task name':
                            null,
                  ),
                  new TextFormField(
                    initialValue: isEditing ? todo.note:'',
                    key: _noteKey,
                    maxLines: 10,
                    decoration: new InputDecoration(
                      hintText: 'Notes about task'
                    ),
                  )
                ],
              )
          ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: isEditing ? 'Save Changes': 'Add Todo',
          child: new Icon(isEditing ? Icons.check: Icons.add),
          onPressed: () {
            if(_formKey.currentState.validate()){
              onSave(
                _taskKey.currentState.value,
                _noteKey.currentState.value
              );

              Navigator.pop(context);
            }
          }
      ),
    );
  }
}
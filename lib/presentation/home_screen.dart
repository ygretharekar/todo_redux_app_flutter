import 'package:flutter/material.dart';
import 'package:todo_redux_app/containers/active_tab.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/containers/filter_selector.dart';
import 'package:todo_redux_app/containers/filtered_todos.dart';
import 'package:todo_redux_app/keys/keys.dart';
import 'package:todo_redux_app/containers/tab_selector.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen():super(key:  Keys.homeScreen);



  @override
  Widget build(BuildContext context) =>
      new ActiveTab(
          builder: (BuildContext context, AppTab activeTab) =>
              new Scaffold(
                appBar: new AppBar(
                  title: new Text("Todo List App"),
                  actions: <Widget>[
                    new FilterSelector(visible: true)
                  ],
                ),
                body: FilteredTodos(),
                floatingActionButton: new FloatingActionButton(
                    key: Keys.addTodoFab,
                    onPressed: () =>
                        Navigator.pushNamed(context, "/addtodo"),
                    child: new Icon(Icons.add),
                    tooltip: 'Add Todo',
                ),
                bottomNavigationBar: new TabSelector(),
              )
      );
}
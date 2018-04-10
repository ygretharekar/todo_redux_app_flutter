import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'reducers/app_state_reducer.dart';
import 'package:todo_redux_app/models/models.dart';
import 'presentation/home_screen.dart';
import 'containers/add_todo.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {

  final store = new Store(
      appReducer,
      initialState: new AppState.loading()
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: "Todo List App",
          theme: new ThemeData.dark(),
          routes: {
            '/': (context) {
              return new StoreBuilder<AppState>(
                  builder: (context, store) {
                    return new HomeScreen();
                  }
              );
            },
            '/addtodo': (context) {
              return new AddTodo();
            }
          },
        )
    );
  }
}
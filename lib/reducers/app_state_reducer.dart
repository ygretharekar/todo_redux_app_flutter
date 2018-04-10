import 'package:todo_redux_app/models/app_state.dart';
import 'loading_reducer.dart';
import 'todos_reducer.dart';
import 'tab_reducer.dart';

AppState appReducer(AppState state, action){
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    todos: todosReducer(state.todos, action),
    activeTab: tabReducer(state.activeTab, action)
  );
}
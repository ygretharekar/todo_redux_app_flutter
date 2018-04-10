import 'package:redux/redux.dart';
import 'package:todo_redux_app/actions/actions.dart';
import 'package:todo_redux_app/models/models.dart';
import 'package:todo_redux_app/selectors/selectors.dart';

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {
  return new List.from(todos)..add(action.todo);
}

List<Todo> _deleteTodo(List<Todo> todos, DeleteTodoAction action){
  return todos.where((todo) => todo.id != action.id).toList();
}

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action){
  return todos
        .map((todo) => todo.id == action.id ? action.updatedTodo: todo);
}

List<Todo> _clearCompleted(List<Todo> todos, ClearCompletedAction action){
  return todos.where((todo) => !todo.complete).toList();
}

List<Todo> _toggleAll(List<Todo> todos, ToggleAllAction action){
  final allComplete = allCompleteSelector(todos);

  return todos.map((todo) => todo.copyWith(complete: !allComplete)).toList();
}

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action){
  return action.todos;
}

List<Todo> _setNoTodos(List<Todo> todos, TodoNotLoadedAction action){
  return [];
}

final Reducer<List<Todo>> todosReducer = combineReducers([
  new TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  new TypedReducer<List<Todo>, DeleteTodoAction>(_deleteTodo),
  new TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
  new TypedReducer<List<Todo>, ClearCompletedAction>(_clearCompleted),
  new TypedReducer<List<Todo>, ToggleAllAction>(_toggleAll),
  new TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  new TypedReducer<List<Todo>, TodoNotLoadedAction>(_setNoTodos)
]);

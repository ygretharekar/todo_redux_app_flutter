import 'package:todo_redux_app/models/models.dart';

class ClearCompletedAction {}

class ToggleAllAction {}

class LoadTodosAction {}

class TodoNotLoadedAction{}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);
}

class UpdateTodoAction {
  final String id;
  final Todo updatedTodo;

  UpdateTodoAction(this.id, this.updatedTodo);
}

class DeleteTodoAction {
final String id;

  DeleteTodoAction(this.id);
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;
  UpdateFilterAction(this.newFilter);
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

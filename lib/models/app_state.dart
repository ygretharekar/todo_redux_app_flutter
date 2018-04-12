import 'package:meta/meta.dart';
import 'package:todo_redux_app/models/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final AppTab activeTab;
  final VisibilityFilter activeFilter;
  final List<Todo> todos;

  AppState({
    this.isLoading = false,
    this.activeTab = AppTab.todos,
    this.activeFilter = VisibilityFilter.all,
    this.todos = const []
  });

  factory AppState.loading() => new AppState(isLoading: false);

  AppState copyWith(
    {
      bool isLoading,
      List<Todo> todos,
      AppTab activeTab,
      VisibilityFilter activeFilter
    }
  ){
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
      activeTab: activeTab ?? this.activeTab,
      activeFilter: activeFilter ?? this.activeFilter
    );
  }

  @override
  // TODO: implement hashCode
  int get hashCode =>
      isLoading.hashCode^
      todos.hashCode^
      activeFilter.hashCode^
      activeTab.hashCode;

  @override
  bool operator ==(other) {
    // TODO: implement ==
    return identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          todos == other.todos &&
          activeTab == other.activeTab &&
          activeFilter == other.activeFilter;
  }


  @override
  String toString() {
    // TODO: implement toString
    return 'AppState{'
        'isLoading: $isLoading, '
        'todos: $todos, activeTab: $activeTab, '
        'activeFilter: $activeFilter}';
  }
}
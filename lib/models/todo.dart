import 'package:meta/meta.dart';
import 'todo_entity.dart';

@immutable
class Todo {
  final bool complete;
  final String note;
  final  String task;

  Todo(this.task, {this.complete = false, this.note = ''});

  Todo copyWith({bool complete, String note, String task}){
    return new Todo(
        task ?? this.task,
        complete: complete ?? this.complete,
        note: note ?? this.note
    );
  }

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode;


  @override
  bool operator ==(other) {
    // TODO: implement ==
    return
      identical(this, other) ||
      other is Todo &&
        runtimeType == other.runtimeType &&
        complete == other.complete &&
        task == other.task &&
        note == other.note;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Todo{complete: $complete, task: $task, note: $note}';
  }

  TodoEntity todoEntity() => TodoEntity(complete, note, task);

  static Todo fromEntity(TodoEntity todoEntity) {
    return new Todo(
      todoEntity.task,
      complete: todoEntity.complete ?? false,
      note: todoEntity.note
    );
  }
}
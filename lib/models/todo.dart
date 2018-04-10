import 'package:meta/meta.dart';
import 'todo_entity.dart';
import 'package:uuid/uuid.dart';

var uuid = new Uuid();

@immutable
class Todo {
  final bool complete;
  final String note;
  final  String task;
  final String id;

  Todo(
      this.task,
      {this.complete = false, String note = '', String id}
  ):
  this.note = note ?? '',
  this.id = id ?? uuid.v4();

  Todo copyWith({bool complete, String id, String note, String task}){
    return new Todo(
        task ?? this.task,
        complete: complete ?? this.complete,
        id: id ?? this.id,
        note: note ?? this.note
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo &&
              runtimeType == other.runtimeType &&
              complete == other.complete &&
              note == other.note &&
              task == other.task &&
              id == other.id;

  @override
  int get hashCode =>
      complete.hashCode ^
      note.hashCode ^
      task.hashCode ^
      id.hashCode;

  @override
  String toString() {
    // TODO: implement toString
    return 'Todo{complete: $complete, task: $task, note: $note id:$id}';
  }

  TodoEntity todoEntity() => TodoEntity(complete, id, note, task);

  static Todo fromEntity(TodoEntity todoEntity) {
    return new Todo(
      todoEntity.task,
      complete: todoEntity.complete ?? false,
      note: todoEntity.note
    );
  }
}
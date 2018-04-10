class TodoEntity {
  bool complete;
  String note;
  String task;
  String id;

  TodoEntity(this.complete, this.id, this.note, this.task);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoEntity &&
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

  Map<String, Object> toJson() => {
    "complete": complete,
    "id": id,
    "task": task,
    "note": note
  };

  @override
  String toString() {
    // TODO: implement toString
    return 'TodoEntity{complete: $complete, task: $task, note: $note, id: $id}';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return new TodoEntity(
      json["complete"] as bool,
      json["id"] as String,
      json["note"] as String,
      json["task"] as String,
    );
  }


}
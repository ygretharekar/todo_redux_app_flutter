class TodoEntity {
  bool complete;
  String note;
  String task;

  TodoEntity(this.complete, this.note, this.task);

  @override
  // TODO: implement hashCode
  int get hashCode => complete.hashCode^note.hashCode^task.hashCode;

  @override
  bool operator ==(other) {
    // TODO: implement ==
    return
      identical(this, other) ||
        other is TodoEntity &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note;
  }

  Map<String, Object> toJson() => {
    "complete": complete,
    "task": task,
    "note": note
  };

  @override
  String toString() {
    // TODO: implement toString
    return 'TodoEntity{complete: $complete, task: $task, note: $note}';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return new TodoEntity(
      json["complete"] as bool,
      json["note"] as String,
      json["task"] as String,
    );
  }


}
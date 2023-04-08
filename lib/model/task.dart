
class Task {
  late final String taskName;
  late bool isDone;

  Task({required this.taskName, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_flutter/model/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  SharedPreferences preferences;
  TaskData(this.preferences);
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(taskName: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
    _addToPrefs();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
    _addToPrefs();
  }

  void deleteTask(int index) async {
    _tasks.removeAt(index);
    notifyListeners();
    _addToPrefs();
  }

  void instantiateTasks(String tasksJSON) {
    if (tasksJSON.isNotEmpty) {
      for (var item in jsonDecode(tasksJSON)) {
        _tasks.add(Task(
            taskName: item['taskName'], isDone: item['isCompleted'] ?? false));
      }
      notifyListeners();
    }
  }

  void _addToPrefs() async {
    await preferences.setString(
        'tasks',
        jsonEncode(_tasks
            .map((task) => {
                  'taskName': task.taskName,
                  'isCompleted': task.isDone,
                })
            .toList()));
  }

  getIndex(int index) {
    _tasks[index];
  }
}

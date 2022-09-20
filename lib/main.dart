import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String tasksJSON = preferences.getString('tasks') ?? '';
  runApp(ChangeNotifierProvider(
    create: (context) {
      TaskData data = TaskData(preferences);
      data.instantiateTasks(tasksJSON);
      return data;
    },
    child: const MaterialApp(
      home: TasksScreen(),
    ),
  ));
}

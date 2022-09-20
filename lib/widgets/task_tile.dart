import 'package:flutter/material.dart';
import 'package:todo_flutter/model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.isChecked,
      this.taskTitle,
      required this.checkboxCallback,
      required this.deleteTask});

  final bool isChecked;
  final String? taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() deleteTask;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
      ),
      onLongPress: deleteTask,
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox(
      {super.key, this.checkboxState, required this.toggleCheckBoxState});

  final bool? checkboxState;
  final Function(bool?) toggleCheckBoxState;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

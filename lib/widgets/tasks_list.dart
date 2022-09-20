import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: ValueKey(
                  Provider.of<TaskData>(context).tasks[index].taskName),
              background: Container(
                color: Colors.redAccent.shade700,
              ),
              onDismissed: (direction) {
                taskData.deleteTask(index);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task Deleted')));
              },
              child: TaskTile(
                isChecked: task.isDone,
                taskTitle: task.taskName,
                checkboxCallback: (checkboxState) {
                  // setState(() {
                  //   Provider.of<TaskData>(context).tasks[index].isDone =
                  //   checkboxState!;
                  // });
                  taskData.updateTask(task);
                },
                deleteTask: () {
                  taskData.deleteTask(index);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

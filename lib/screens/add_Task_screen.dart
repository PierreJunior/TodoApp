import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/task_data.dart';

late String newTaskTitle;

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: const Text(
            "Add Task",
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: TextFormField(
            onChanged: (newText) {
              newTaskTitle = newText;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 5, color: Colors.lightBlueAccent))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ElevatedButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle);
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(300, 40)),
            child: const Text("Add"),
          ),
        )
      ],
    );
  }
}

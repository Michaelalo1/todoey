import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isDone,
            taskTitle: tasks[index].name,
            checkboxCallBack: (bool? checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}

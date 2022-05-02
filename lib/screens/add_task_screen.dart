import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_list.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  static late String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: const Text(
                'Add Task',
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
              child: TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(60.0, 0.00, 60.0, 10.0),
              child: TextButton(
                  onPressed: () {
                    addTaskCallback(newTaskTitle);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

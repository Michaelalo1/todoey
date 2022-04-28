import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  void toggleCheckbox(bool? newValue) {
    setState(() {
      isChecked = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          'This is a Task',
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: TaskCheckBox(toggleCheckbox, isChecked));
  }
}

class TaskCheckBox extends StatelessWidget {
  final bool checkBoxState;
  final void Function(bool?) checkBoxCallBack;

  TaskCheckBox(this.checkBoxCallBack, this.checkBoxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: checkBoxCallBack,
    );
  }
}

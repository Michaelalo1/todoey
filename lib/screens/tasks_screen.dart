import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/models/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
    Task(name: 'Buy Oil'),
    Task(name: 'Buy Pan'),
    Task(name: 'Fry Eggs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder:
                  (context) => /*SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child:*/
                      AddTaskScreen((newTaskTitle) {
                        setState(() {
                          tasks.add(Task(name: newTaskTitle));
                          Navigator.pop(context);
                        });
                      }));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.0),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: TasksList(tasks)),
          )
        ],
      ),
    );
  }
}

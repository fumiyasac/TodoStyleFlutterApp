import 'package:flutter/material.dart';
import 'package:todo_sample_app_with_provider/widgets/task_tile.dart';
import 'package:todo_sample_app_with_provider/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'AmazonでFlutter書籍の購入'),
    Task(name: '燃えるゴミを出す'),
    Task(name: '猫砂を交換する＆トイレの掃除'),
  ];

  @override
  Widget build(BuildContext context) {
    // MEMO: ListからListViewを表示する
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            }
        );
      },
      itemCount: tasks.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample_app_with_provider/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      // MEMO: 0xff + HEXとしている点に注意
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              'タスクの新規作成',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
                child: Text('追加する', style: TextStyle(color: Colors.white)),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  // MEMO: 値が更新された通知を伝える「notifyListeners();」をTaskDataクラスに定義する
                  Provider.of<TaskData>(context).addTask(newTaskTitle);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}

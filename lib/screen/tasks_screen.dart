import 'package:flutter/material.dart';
import 'package:todo_sample_app_with_provider/widgets/tasks_list.dart';
import 'package:todo_sample_app_with_provider/screen/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample_app_with_provider/models/task_data.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen((newTaskTitle) {

                    // TODO: 後でProviderを利用して書き直す部分
                    // setState(() {
                    //   tasks.add(Task(name: newTaskTitle));
                    // });

                  }),
                ),
              ));
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'SkyTodo',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700),
                ),
                // MEMO: Providerを経由してStateの変化をキャッチする(StatelessWidgetでも状態変化をキャッチ可能になる)
                // おおもとにあるWidget(MyApp)がChangeNotifierProviderの対象となっているのでその中に含まれているものは監視対象となる点がポイント
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: TasksList()),
          ),
        ],
      ),
    );
  }
}

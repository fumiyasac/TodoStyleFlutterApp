import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample_app_with_provider/models/task_data.dart';
import 'package:todo_sample_app_with_provider/widgets/task_tile.dart';

// MEMO: Providerを経由してStateの変化をキャッチする(StatelessWidgetでも状態変化をキャッチ可能になる)
// おおもとにあるWidget(MyApp)がChangeNotifierProviderの対象となっているのでその中に含まれているものは監視対象となる点がポイント

// MEMO: Providerを利用する際に利用できる「Consumer Widget」を利用する
// ここでは「Provider.of<TaskData>(context) ... 」をまとめて適用可能になる

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MEMO: ListからListViewを表示する
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (_) {
                  // MEMO: 表示対象のTaskモデルのオブジェクトの状態を変更し、その後ListViewを再度表示する
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  // MEMO: 表示対象のTaskモデルを削除し、その後ListViewを再度表示する
                  taskData.deleteTask(task);
                },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

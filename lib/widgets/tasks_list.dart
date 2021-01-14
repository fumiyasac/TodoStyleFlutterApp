import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample_app_with_provider/models/task_data.dart';
import 'package:todo_sample_app_with_provider/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MEMO: ListからListViewを表示する
    return ListView.builder(
      itemBuilder: (context, index) {

        // MEMO: Providerを経由してStateの変化をキャッチする(StatelessWidgetでも状態変化をキャッチ可能になる)
        // おおもとにあるWidget(MyApp)がChangeNotifierProviderの対象となっているのでその中に含まれているものは監視対象となる点がポイント
        return TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              // TODO: 後でProviderを利用して書き直す部分
            });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}

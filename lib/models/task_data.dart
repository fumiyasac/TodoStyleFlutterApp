import 'package:flutter/foundation.dart';
import 'package:todo_sample_app_with_provider/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  // MEMO: _をつけるとprivateになる(Dartの仕様)
  List<Task> _tasks = [
    Task(name: 'AmazonでFlutter書籍の購入'),
    Task(name: '燃えるゴミを出す'),
    Task(name: '猫砂を交換する＆トイレの掃除'),
  ];

  // MEMO: ComputedなPropertyは「(型名) get (変数)」の様に設定する

  // MEMO: 各Widget処理内で書き換えができてしまう恐れがあるので書き換え不可能な形にしている
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }
}

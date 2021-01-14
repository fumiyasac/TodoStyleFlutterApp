import 'package:flutter/foundation.dart';
import 'package:todo_sample_app_with_provider/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'AmazonでFlutter書籍の購入'),
    Task(name: '燃えるゴミを出す'),
    Task(name: '猫砂を交換する＆トイレの掃除'),
  ];
}

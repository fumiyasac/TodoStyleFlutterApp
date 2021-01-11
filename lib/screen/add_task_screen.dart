import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ),
            FlatButton(
                child: Text('追加する', style: TextStyle(color: Colors.white)),
                color: Colors.lightBlueAccent,
                onPressed: () {

                })
          ],
        ),
      ),
    );
  }
}

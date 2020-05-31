import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_menu_dialog.dart';
import 'package:practicemvvm/model/term.dart';

Widget termTile(BuildContext context, dynamic value) {
  final term = value as Term;

  return FlatButton(
    onPressed: () {
      // ToDo: go to show term page
    },
    onLongPress: () {
      // ToDo: go to edit term page
    },
    child: Column(
      children: <Widget>[
        Text('タイトル: ${term.title}'),
        Text('世界: ${term.worldId}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Text('作成時間: ${term.createTime}'),
                Text('更新期間: ${term.updateTime}'),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => showMenuDialog(context, term),
            ),
          ],
        ),
      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_menu_dialog.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/ui/contents_detail/edit_page/edit_term/edit_term_home.dart';
import 'package:practicemvvm/ui/contents_detail/show_page/show_term/show_term_page.dart';

Widget termTile(BuildContext context, dynamic value) {
  final term = value as Term;

  return FlatButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute<ShowTermPage>(
          builder: (_) => ShowTermPage(term),
        ),
      );
    },
    onLongPress: () {
      Navigator.push(
        context,
        MaterialPageRoute<EditTermHome>(
          builder: (_) => EditTermHome(term),
        ),
      );
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

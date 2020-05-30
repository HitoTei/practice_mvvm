import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_delete_dialog.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:provider/provider.dart';

Widget storyTile(BuildContext context, dynamic value) {
  final story = value as Story;

  return FlatButton(
    onPressed: () {
      // ToDo: go to show contents page
    },
    onLongPress: () => showDeleteDialog(
      context,
      () =>
          Provider.of<WorksViewModel>(context, listen: false).deleteWork(story),
    ),
    child: Column(
      children: <Widget>[
        Text('タイトル: ${story.title}'),
        Text('世界: ${story.worldId}'),
        Text('作成時間: ${story.createTime}'),
        Text('更新期間: ${story.updateTime}'),
      ],
    ),
  );
}

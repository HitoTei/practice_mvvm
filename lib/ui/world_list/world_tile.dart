import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_delete_dialog.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/story_list/story_home_page.dart';
import 'package:provider/provider.dart';

Widget worldTile(BuildContext context, dynamic value) {
  final world = value as World;
  return FlatButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute<StoryHomePage>(
        builder: (BuildContext context) {
          return StoryHomePage(world);
        },
      ),
    ),
    onLongPress: () => showDeleteDialog(
      context,
      () =>
          Provider.of<WorksViewModel>(context, listen: false).deleteWork(world),
    ),
    child: Column(
      children: <Widget>[
        Text('タイトル: ${world.title}'),
        Text('作成時間: ${world.createTime}'),
        Text('更新期間: ${world.updateTime}'),
      ],
    ),
  );
}

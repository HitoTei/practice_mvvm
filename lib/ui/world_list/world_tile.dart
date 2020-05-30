import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_menu_dialog.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/story_list/story_home_page.dart';

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
    onLongPress: () => showMenuDialog(context, world),
    child: Column(
      children: <Widget>[
        Text('タイトル: ${world.title}'),
        Text('作成時間: ${world.createTime}'),
        Text('更新期間: ${world.updateTime}'),
      ],
    ),
  );
}
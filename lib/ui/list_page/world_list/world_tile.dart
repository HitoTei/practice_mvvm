import 'package:flutter/material.dart';
import 'package:practicemvvm/base/functions.dart';
import 'package:practicemvvm/dialog/show_menu_dialog.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/list_page/story_list/story_home_page.dart';
import 'package:practicemvvm/ui/list_page/world_content/world_content_page.dart';

Widget worldTile(BuildContext context, dynamic value) {
  final world = value as World;
  return FlatButton(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute<StoryHomePage>(
        builder: (BuildContext context) {
          return WorldContentPage(world);
        },
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${world.title}',
          style: const TextStyle(fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '作成時間: ${dateToString(world.createTime)}',
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  '更新期間: ${dateToString(world.updateTime)}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => showMenuDialog(context, world),
            )
          ],
        ),
      ],
    ),
  );
}

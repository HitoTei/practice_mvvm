import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_menu_dialog.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/ui/contents_detail/edit_page/edit_story/edit_story_home.dart';
import 'package:practicemvvm/ui/contents_detail/show_page/show_story/show_story_page.dart';

Widget storyTile(BuildContext context, dynamic value) {
  final story = value as Story;

  return FlatButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute<ShowStoryPage>(
          builder: (_) => ShowStoryPage(story),
        ),
      );
    },
    onLongPress: () {
      Navigator.push(
        context,
        MaterialPageRoute<EditStoryHome>(
          builder: (_) => EditStoryHome(story),
        ),
      );
    },
    child: Column(
      children: <Widget>[
        Text('タイトル: ${story.title}'),
        Text('世界: ${story.worldId}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Text('作成時間: ${story.createTime}'),
                Text('更新期間: ${story.updateTime}'),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () => showMenuDialog(context, story),
            ),
          ],
        ),
      ],
    ),
  );
}

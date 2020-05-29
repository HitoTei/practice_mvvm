import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/story.dart';

Widget storyTile(BuildContext context, dynamic value) {
  final story = value as Story;

  return Column(
    children: <Widget>[
      Text('タイトル: ${story.title}'),
      Text('世界: ${story.worldId}'),
      Text('作成時間: ${story.createTime}'),
      Text('更新期間: ${story.updateTime}'),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/ui/story_list/story_home_page.dart';

import 'constant_strings.dart';

class World extends Work {
  World();

  @override
  World.fromMap(Map<String, dynamic> map) {
    id = map[idStr] as int;
    createTime = DateTime.parse(map[createTimeStr] as String);
    updateTime = DateTime.parse(map[updateTimeStr] as String);
    title = map[titleStr] as String;
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      idStr: id,
      createTimeStr: createTime.toString(),
      updateTimeStr: updateTime.toString(),
      titleStr: title,
    };
  }

  @override
  String getTableName() {
    return 'worlds';
  }

  @override
  Widget tile(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute<StoryHomePage>(
          builder: (BuildContext context) {
            return StoryHomePage(this);
          },
        ),
      ),
      child: Column(
        children: <Widget>[
          Text('タイトル: $title'),
          Text('作成時間: $createTime'),
          Text('更新期間: $updateTime'),
        ],
      ),
    );
  }
}

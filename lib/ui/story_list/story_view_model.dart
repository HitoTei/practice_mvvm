import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class StoriesViewModel extends ChangeNotifier {
  StoriesViewModel(this.world);

  List<Story> storyList = null;
  World world;
  int newId = 0;
  Future<void> queryStories() async {
    storyList = await SqlProvider().queryWorldStoryListWithoutContent(world.id);
    for (final story in storyList) newId = max(newId, story.id);
    notifyListeners();
  }

  Future<void> insertStory(Story story) async {
    story.updateTime = DateTime.now();
    SqlProvider().insert(story);
    notifyListeners();
  }

  Future<void> insertNewStory(String title) async {
    final story = Story()
      ..id = ++newId
      ..title = title
      ..worldId = world.id
      ..createTime = DateTime.now()
      ..updateTime = DateTime.now();

    storyList.add(story);
    SqlProvider().insert(story);
    notifyListeners();
  }

  Future<void> deleteStory(Story story) async {
    SqlProvider().delete(story);
    storyList.remove(story);
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class StoriesViewModel with ChangeNotifier {
  StoriesViewModel(this.world);

  List<Story> storyList = null;
  World world;

  Future<void> queryStories() async {
    storyList = await SqlProvider().queryWorldStoryListWithoutContent(world.id);
    notifyListeners();
  }

  Future<void> updateStory(Story story) async {
    story.updateTime = DateTime.now();
    SqlProvider().insert(story);
    notifyListeners();
  }

  Future<void> insertNewStory(String title) async {
    final story = Story()
      ..title = title
      ..worldId = world.id
      ..createTime = DateTime.now()
      ..updateTime = DateTime.now();

    await SqlProvider().insert(story);
    queryStories();
  }

  Future<void> deleteStory(Story story) async {
    await SqlProvider().delete(story);
    deleteStory(story);
    notifyListeners();
  }
}

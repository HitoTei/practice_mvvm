import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class StoriesViewModel extends WorksViewModel {
  StoriesViewModel(this.world);

  List<Story> storyList = null;
  World world;

  @override
  List<Work> getWorkList() => storyList;

  @override
  Future<void> queryWorks() async {
    storyList = await SqlProvider().queryWorldStoryListWithoutContent(world.id);
    notifyListeners();
  }

  @override
  Future<void> updateWork(Work work) async {
    work.updateTime = DateTime.now();
    SqlProvider().insert<Story>(work as Story);
    notifyListeners();
  }

  @override
  Future<void> insertNewWork(String title) async {
    final time = DateTime.now();
    final story = Story()
      ..title = title
      ..worldId = world.id
      ..createTime = time
      ..updateTime = time;

    await SqlProvider().insert(story);
    queryWorks();
  }

  @override
  Future<void> deleteWork(Work work) async {
    await SqlProvider().delete<Story>(work as Story);
    storyList.remove(work);
    notifyListeners();
  }
}

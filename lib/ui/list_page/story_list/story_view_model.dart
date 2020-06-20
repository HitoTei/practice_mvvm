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
    storyList = await SqlProvider().queryWorldStoryList(world.id);
    notifyListeners();
  }

  @override
  Future<void> updateWork(Work work) async {
    work.updateTime = DateTime.now();

    SqlProvider().insert<Story>(work as Story);
    notifyListeners();
  }

  @override
  Future<void> insertWork(String title) async {
    final time = DateTime.now();
    final story = Story()
      ..title = title
      ..worldId ??= world.id
      ..createTime ??= time
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

  @override
  void sortByCreateTime({bool asc}) {
    storyList.sort(
      (Story v1, Story v2) {
        if (asc)
          return v1?.createTime?.compareTo(v2.createTime) ?? 0;
        else
          return v2?.createTime?.compareTo(v1.createTime) ?? 0;
      },
    );
    notifyListeners();
  }

  @override
  void sortByTitle({bool asc}) {
    storyList.sort(
      (Story v1, Story v2) {
        if (asc)
          return v1?.title?.compareTo(v2.title) ?? 0;
        else
          return v2?.title?.compareTo(v1.title) ?? 0;
      },
    );
    notifyListeners();
  }

  @override
  void sortByUpdateTime({bool asc}) {
    storyList.sort(
      (Story v1, Story v2) {
        if (asc)
          return v1?.updateTime?.compareTo(v2.updateTime) ?? 0;
        else
          return v2?.updateTime?.compareTo(v1.updateTime) ?? 0;
      },
    );
    notifyListeners();
  }
}

import 'dart:async';

import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class WorldsViewModel extends WorksViewModel {
  List<World> worldList = null;

  @override
  List<Work> getWorkList() => worldList;

  @override
  Future<void> queryWorks() async {
    worldList = await SqlProvider().queryWorldList();
    notifyListeners();
  }

  @override
  Future<void> updateWork(Work work) async {
    work.updateTime = DateTime.now();
    await SqlProvider().insert<World>(work as World);

    notifyListeners();
  }

  @override
  Future<void> insertWork(String title) async {
    final time = DateTime.now();
    final world = World()
      ..title = title
      ..createTime ??= time
      ..updateTime = time;

    await SqlProvider().insert(world);
    queryWorks();
  }

  @override
  Future<void> deleteWork(Work work) async {
    await SqlProvider().delete<World>(work as World);
    SqlProvider().deleteWorldStory(work.id); // こっちは特に待つ必要がない。

    worldList.remove(work);
    notifyListeners();
  }
}

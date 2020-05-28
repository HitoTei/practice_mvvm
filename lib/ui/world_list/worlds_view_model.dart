import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class WorldsViewModel with ChangeNotifier {
  List<World> worldList = null;

  Future<void> queryWorlds() async {
    worldList = await SqlProvider().queryWorldList();
    notifyListeners();
  }

  Future<void> updateWorld(World world) async {
    world.updateTime = DateTime.now();
    SqlProvider().insert(world);

    notifyListeners();
  }

  Future<void> insertNewWorld(String title) async {
    final world = World()
      ..title = title
      ..createTime = DateTime.now()
      ..updateTime = DateTime.now();

    await SqlProvider().insert(world);
    queryWorlds();
  }

  Future<void> deleteWorld(World world) async {
    await SqlProvider().delete(world);
    SqlProvider().deleteWorldStory(world.id); // こっちは特に待つ必要がない。

    worldList.remove(world);
    notifyListeners();
  }
}

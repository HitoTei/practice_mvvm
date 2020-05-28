import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class WorldsViewModel with ChangeNotifier {
  List<World> worldList = null;
  static int newId = 0;

  Future<void> queryWorlds() async {
    worldList = await SqlProvider().queryWorldList();
    for (final world in worldList) newId = max(newId, world.id);

    notifyListeners();
  }

  Future<void> updateWorld(World world) async {
    world.updateTime = DateTime.now();
    SqlProvider().insert(world);

    notifyListeners();
  }

  Future<void> insertNewWorld(String title) async {
    final world = World()
      ..id = ++newId
      ..title = title
      ..createTime = DateTime.now()
      ..updateTime = DateTime.now();

    worldList.add(world);
    SqlProvider().insert(world);
    notifyListeners();
  }

  Future<void> deleteWorld(World world) async {
    SqlProvider().delete(world);
    worldList.remove(world);
    notifyListeners();
  }
}

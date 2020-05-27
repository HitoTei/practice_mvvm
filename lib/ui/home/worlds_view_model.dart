import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class WorldsViewModel with ChangeNotifier {
  List<World> worldList = null;

  Future<void> queryWorlds() async {
    worldList = await SqlProvider().query();
    notifyListeners();
  }

  Future<void> insertWorld(World world) async {
    SqlProvider().insert(world);
    worldList.add(world);
    notifyListeners();
  }

  Future<void> insertNewWorld(String title) async {
    final world = World()
      ..title = title
      ..createTime = DateTime.now()
      ..updateTime = DateTime.now();
    insertWorld(world);
  }

  Future<void> deleteWorld(World world) async {
    SqlProvider().delete(world);
    worldList.remove(world);
    notifyListeners();
  }
}

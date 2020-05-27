import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/home/worlds_view_model.dart';
import 'package:provider/provider.dart';

class WorldListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<WorldsViewModel>(context);
    final worldList = homeViewModel.worldList;

    return ListView.separated(
      itemBuilder: (context, index) => WorldTile(worldList[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: worldList.length,
    );
  }
}

class WorldTile extends StatelessWidget {
  const WorldTile(World world) : _world = world;
  final World _world;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('タイトル: ${_world.title}'),
        Text('作成時間: ${_world.createTime}'),
        Text('更新期間: ${_world.updateTime}'),
      ],
    );
  }
}

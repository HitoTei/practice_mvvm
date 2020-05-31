import 'package:flutter/material.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/ui/list_page/base_list/insert_work_button.dart';
import 'package:practicemvvm/ui/list_page/base_list/work_list_router.dart';
import 'package:practicemvvm/ui/list_page/world_list/world_tile.dart';
import 'package:practicemvvm/ui/list_page/world_list/worlds_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorksViewModel>(
          create: (_) => WorldsViewModel(),
        ),
        Provider<TileFactory>.value(value: worldTile),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('novel writer'),
          actions: <Widget>[
            InsertWorkButton(),
          ],
        ),
        body: WorkListRouterPage(),
      ),
    );
  }
}

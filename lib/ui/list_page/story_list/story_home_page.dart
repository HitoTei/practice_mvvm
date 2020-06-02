import 'package:flutter/material.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/list_page/base_list/insert_work_button.dart';
import 'package:practicemvvm/ui/list_page/base_list/work_list_router.dart';
import 'package:practicemvvm/ui/list_page/story_list/story_tile.dart';
import 'package:practicemvvm/ui/list_page/story_list/story_view_model.dart';
import 'package:provider/provider.dart';

class StoryHomePage extends StatelessWidget {
  const StoryHomePage(World world) : _world = world;
  final World _world;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorksViewModel>(
          create: (_) => StoriesViewModel(_world),
        ),
        Provider<TileFactory>.value(value: storyTile),
      ],
      child: Scaffold(
        body: WorkListRouterPage(),
        floatingActionButton: const InsertWorkButton(),
      ),
    );
  }
}

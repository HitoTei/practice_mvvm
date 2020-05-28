import 'package:flutter/material.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/story_list/story_list_router.dart';
import 'package:practicemvvm/ui/story_list/story_view_model.dart';
import 'package:provider/provider.dart';

import 'insert_story_button.dart';

class StoryHomePage extends StatelessWidget {
  const StoryHomePage(World world) : _world = world;
  final World _world;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoriesViewModel(_world),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _world.title,
          ),
          actions: <Widget>[
            InsertStoryButton(),
          ],
        ),
        body: StoryListRouterPage(),
      ),
    );
  }
}

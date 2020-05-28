import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/ui/story_list/story_view_model.dart';
import 'package:practicemvvm/ui/world_list/world_list_page.dart';
import 'package:provider/provider.dart';

class StoryListRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storyViewModel = Provider.of<StoriesViewModel>(context);

    if (storyViewModel.storyList == null) {
      storyViewModel.queryStories();
      return const CircularProgressIndicator();
    }

    return WorldListPage();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/ui/story_list/story_view_model.dart';
import 'package:provider/provider.dart';

class StoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<StoriesViewModel>(context);
    final storyList = homeViewModel.storyList;

    return ListView.separated(
      itemBuilder: (context, index) => StoryTile(storyList[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: storyList.length,
    );
  }
}

class StoryTile extends StatelessWidget {
  const StoryTile(Story story) : _story = story;
  final Story _story;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('タイトル: ${_story.title}'),
        Text('作成時間: ${_story.createTime}'),
        Text('更新期間: ${_story.updateTime}'),
      ],
    );
  }
}

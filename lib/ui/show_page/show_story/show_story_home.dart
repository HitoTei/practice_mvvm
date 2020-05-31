import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/ui/show_page/show_story/show_story_page.dart';
import 'package:practicemvvm/ui/show_page/show_story/show_story_view_model.dart';
import 'package:provider/provider.dart';

class ShowStoryHome extends StatelessWidget {
  const ShowStoryHome(this.story);
  final Story story;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: ShowStoryViewModel(story),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(story.title ?? ''),
        ),
        body: ShowStoryPage(),
      ),
    );
  }
}

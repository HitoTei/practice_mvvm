import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/ui/contents_detail/show_page/show_contents_page.dart';

class ShowStoryPage extends StatelessWidget {
  const ShowStoryPage(this.story);
  final Story story;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title ?? ''),
      ),
      body: ShowContentsPage(story.contents),
    );
  }
}

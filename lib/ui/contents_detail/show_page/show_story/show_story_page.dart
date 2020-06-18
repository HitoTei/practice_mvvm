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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more),
            onPressed: () => showDialog<SimpleDialog>(
              context: context,
              builder: (_) => SimpleDialog(
                children: <Widget>[
                  Text(
                    '文字数: ${(story.contents.length ?? 0).toString()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: ShowContentsPage(story.contents),
    );
  }
}

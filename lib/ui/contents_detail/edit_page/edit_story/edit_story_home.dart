import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:provider/provider.dart';

import '../edit_contents_page.dart';
import 'edit_story_view_model.dart';

class EditStoryHome extends StatelessWidget {
  const EditStoryHome(this.story);
  final Story story;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EditorViewModel>.value(
          value: EditStoryViewModel(story),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            story.title,
          ),
        ),
        body: EditContentsPage(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/ui/edit_page/edit_story/edit_story_view_model.dart';
import 'package:practicemvvm/ui/edit_page/edit_story/story_save_button.dart';
import 'package:provider/provider.dart';

import 'edit_story_page.dart';

class EditStoryHome extends StatelessWidget {
  const EditStoryHome(this.story);
  final Story story;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: EditStoryViewModel(story),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            StorySaveButton(),
          ],
          title: Text(
            story.title,
          ),
        ),
        body: EditStoryPage(),
      ),
    );
  }
}

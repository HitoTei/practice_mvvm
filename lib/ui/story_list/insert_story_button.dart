import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:practicemvvm/ui/story_list/story_view_model.dart';
import 'package:provider/provider.dart';

class InsertStoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showInsertDialog(
        context,
        Provider.of<StoriesViewModel>(context, listen: false).insertNewStory,
      ),
    );
  }
}

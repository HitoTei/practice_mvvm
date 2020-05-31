import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_story_view_model.dart';

class StorySaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.save),
      onPressed: () {
        Provider.of<EditStoryViewModel>(context, listen: false).saveStory();
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: const Text('保存しました'),
          ),
        );
      },
    );
  }
}

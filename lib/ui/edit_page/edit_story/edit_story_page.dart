import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/ui/edit_page/edit_story/edit_story_view_model.dart';
import 'package:provider/provider.dart';

class EditStoryPage extends StatefulWidget {
  @override
  _EditStoryPageState createState() => _EditStoryPageState();
}

class _EditStoryPageState extends State<EditStoryPage> {
  final _editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditStoryViewModel>(context);
    _editController
      ..text = viewModel.content ?? ''
      ..addListener(
        () => viewModel.content = _editController.text,
      );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _editController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _editController.dispose();
    super.dispose();
  }
}

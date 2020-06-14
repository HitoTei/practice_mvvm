import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:provider/provider.dart';

class EditContentsPage extends StatefulWidget {
  @override
  _EditContentsPageState createState() => _EditContentsPageState();
}

class _EditContentsPageState extends State<EditContentsPage> {
  final _editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditorViewModel>(context);
    _editController
      ..text = viewModel.getContents() ?? ''
      ..addListener(
        () => viewModel.setContents(_editController.text),
      );

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _editController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(
              fontSize: 20,
            ),
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

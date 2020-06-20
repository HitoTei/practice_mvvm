import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.save),
      onPressed: () {
        Provider.of<EditorViewModel>(context, listen: false).save();
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: const Text('保存しました'),
          ),
        );
      },
    );
  }
}

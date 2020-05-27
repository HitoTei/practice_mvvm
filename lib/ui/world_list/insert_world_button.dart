import 'package:flutter/material.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/home/worlds_view_model.dart';
import 'package:provider/provider.dart';

class InsertWorldButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showInsertDialog(
        context,
        Provider.of<WorldsViewModel>(context, listen: false).insertNewWorld,
      ),
    );
  }
}

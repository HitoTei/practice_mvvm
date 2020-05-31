import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:provider/provider.dart';

class InsertWorkButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showInsertDialog(
        context,
        Provider.of<WorksViewModel>(context, listen: false).insertWork,
      ),
    );
  }
}

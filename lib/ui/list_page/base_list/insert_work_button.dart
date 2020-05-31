import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:provider/provider.dart';

class InsertWorkButton extends StatelessWidget {
  const InsertWorkButton({this.insert});
  final Function(void) insert;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => showInsertDialog(
        context,
        insert ??
            Provider.of<WorksViewModel>(context, listen: false).insertWork,
      ),
    );
  }
}

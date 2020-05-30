import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_delete_dialog.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:provider/provider.dart';

Future<void> showMenuDialog(BuildContext context, Work work) async {
  final viewModel = Provider.of<WorksViewModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      title: const Text('メニュー'),
      children: <Widget>[
        FlatButton(
          child: const Text('タイトル編集'),
          onPressed: () async {
            Navigator.pop(context);
            await showInsertDialog(
              context,
              (String title) {
                work.title = title;
                viewModel.updateWork(work);
              },
              initialValue: work.title,
            );
          },
        ),
        FlatButton(
          child: const Text('削除'),
          onPressed: () async {
            Navigator.pop(context);
            await showDeleteDialog(
              context,
              () => viewModel.deleteWork(work),
            );
          },
        )
      ],
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:practicemvvm/ui/list_page/term_list/term_view_model.dart';
import 'package:provider/provider.dart';

class TermTagWidget extends StatelessWidget {
  const TermTagWidget(this.currentTag, this.previousTag);

  final String currentTag;
  final String previousTag;

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<WorksViewModel>(context, listen: false) as TermsViewModel;

    if (currentTag != previousTag &&
        currentTag != null &&
        currentTag.isNotEmpty) {
      return FlatButton(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                currentTag,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const Divider(),
          ],
        ),
        onPressed: () {
          showInsertDialog(
            context,
            (newTag) {
              viewModel.updateTag(currentTag, newTag);
            },
            initialValue: currentTag,
            title: 'タグ',
          );
        },
      );
    }

    return Container();
  }
}

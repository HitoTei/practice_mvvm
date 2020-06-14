import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/dialog/show_insert_dialog.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/ui/contents_detail/edit_page/edit_term/edit_term_view_model.dart';
import 'package:provider/provider.dart';

class EditTagButton extends StatelessWidget {
  const EditTagButton(Term term) : _term = term;
  final Term _term;

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<EditorViewModel>(context) as EditTermViewModel;
    return IconButton(
      icon: const Icon(Icons.label),
      onPressed: () => showInsertDialog(
        context,
        viewModel.saveTag,
        title: 'タグ',
        initialValue: _term.tag ?? '',
      ),
    );
  }
}

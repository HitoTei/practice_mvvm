import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/ui/contents_detail/edit_page/edit_term/edit_tag_button.dart';
import 'package:provider/provider.dart';

import '../edit_contents_page.dart';
import '../save_button.dart';
import 'edit_term_view_model.dart';

class EditTermHome extends StatelessWidget {
  const EditTermHome(this.term);
  final Term term;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EditorViewModel>.value(
          value: EditTermViewModel(term),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            EditTagButton(term),
            SaveButton(),
          ],
          title: Text(
            term.title ?? '',
          ),
        ),
        body: const EditContentsPage(),
      ),
    );
  }
}

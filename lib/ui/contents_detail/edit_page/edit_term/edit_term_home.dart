import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/model/term.dart';
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
            SaveButton(),
          ],
          title: Text(
            term.title,
          ),
        ),
        body: EditContentsPage(),
      ),
    );
  }
}
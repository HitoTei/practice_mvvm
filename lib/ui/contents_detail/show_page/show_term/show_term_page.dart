import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/ui/contents_detail/show_page/show_contents_page.dart';

class ShowTermPage extends StatelessWidget {
  const ShowTermPage(this.term);
  final Term term;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.title ?? ''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.label),
            onPressed: () => showDialog<SimpleDialog>(
              context: context,
              builder: (_) => SimpleDialog(
                children: <Widget>[
                  const Text('タグ'),
                  Text(term.tag ?? ''),
                ],
              ),
            ),
          )
        ],
      ),
      body: ShowContentsPage(term.contents),
    );
  }
}

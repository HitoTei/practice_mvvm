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
            icon: const Icon(Icons.more),
            onPressed: () => showDialog<SimpleDialog>(
              context: context,
              builder: (_) => SimpleDialog(
                children: <Widget>[
                  Text(
                    'タグ: ${term.tag ?? ''}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    '文字数: ${(term.contents.length ?? 0).toString()}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: ShowContentsPage(
        term.contents,
        isMarkdown: term.title?.contains('(md)') ?? false,
      ),
    );
  }
}

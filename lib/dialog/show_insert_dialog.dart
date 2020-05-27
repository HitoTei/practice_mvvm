import 'package:flutter/material.dart';

Future<void> showInsertDialog(
    BuildContext context, Function(String) insert) async {
  String title;

  return showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      children: <Widget>[
        const Text('題名'),
        TextField(
          onChanged: (value) {
            title = value;
          },
        ),
        FlatButton(
          child: const Text('追加'),
          onPressed: () {
            insert(title);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

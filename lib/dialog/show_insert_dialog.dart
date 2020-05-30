import 'package:flutter/material.dart';

Future<void> showInsertDialog(
  BuildContext context,
  Function(String) insert, {
  String initialValue = '',
}) async {
  String title;

  return showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      title: const Text('題名'),
      children: <Widget>[
        TextFormField(
          initialValue: initialValue,
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

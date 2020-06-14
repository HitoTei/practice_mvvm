import 'package:flutter/material.dart';

Future<void> showInsertDialog(
  BuildContext context,
  Function(String) insert, {
  String initialValue = '',
  String title = '題名',
}) async {
  var editing = initialValue;

  return showDialog(
    context: context,
    builder: (_) =>
        SimpleDialog(
          title: Text(
            title,
          ),
          children: <Widget>[
            TextFormField(
              initialValue: initialValue,
              onChanged: (value) {
                editing = value;
              },
            ),
            FlatButton(
              child: const Text('追加'),
              onPressed: () {
                if (editing != null && editing.isNotEmpty) insert(editing);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

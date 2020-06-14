import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:provider/provider.dart';

Future<void> showSortDialog(BuildContext context) {
  final viewModel = Provider.of<WorksViewModel>(context, listen: false);

  return showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      title: const Text('ソート'),
      children: <Widget>[
        FlatButton(
          child: const Text('タイトル:昇順'),
          onPressed: () {
            viewModel.sortByTitle(asc: true);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('タイトル:降順'),
          onPressed: () {
            viewModel.sortByTitle(asc: false);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('作成時間:昇順'),
          onPressed: () {
            viewModel.sortByCreateTime(asc: true);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('作成時間:降順'),
          onPressed: () {
            viewModel.sortByCreateTime(asc: false);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('更新時間:昇順'),
          onPressed: () {
            viewModel.sortByUpdateTime(asc: true);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: const Text('更新時間:降順'),
          onPressed: () {
            viewModel.sortByUpdateTime(asc: false);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

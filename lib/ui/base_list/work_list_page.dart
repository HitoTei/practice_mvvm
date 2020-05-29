import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:provider/provider.dart';

class WorkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<WorksViewModel>(context);
    final worldList = homeViewModel.getWorkList();

    return ListView.separated(
      itemBuilder: (context, index) => worldList[index].tile(context),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: worldList.length,
    );
  }
}

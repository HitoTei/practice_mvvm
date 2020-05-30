import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:provider/provider.dart';

class WorkListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final worksViewModel = Provider.of<WorksViewModel>(context);
    final tileFactory = Provider.of<TileFactory>(context);
    final workList = worksViewModel.getWorkList();

    return ListView.separated(
      itemBuilder: (context, index) => tileFactory(context, workList[index]),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: workList.length,
    );
  }
}

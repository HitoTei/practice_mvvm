import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/ui/base_list/work_list_page.dart';
import 'package:provider/provider.dart';

class WorkListRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storyViewModel = Provider.of<WorksViewModel>(context);

    if (storyViewModel.getWorkList() == null) {
      storyViewModel.queryWorks();
      return const CircularProgressIndicator();
    }

    return WorkListPage();
  }
}

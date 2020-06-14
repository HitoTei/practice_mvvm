import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/ui/list_page/term_list/term_list_page.dart';
import 'package:provider/provider.dart';

class TermListRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final worksViewModel = Provider.of<WorksViewModel>(context);

    if (worksViewModel.getWorkList() == null) {
      worksViewModel.queryWorks();
      return const CircularProgressIndicator();
    }

    return TermListPage();
  }
}

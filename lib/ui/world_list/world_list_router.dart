import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/ui/home/worlds_view_model.dart';
import 'package:practicemvvm/ui/world_list/world_list_page.dart';
import 'package:provider/provider.dart';

class WorldListRouterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<WorldsViewModel>(context);
    if (homeViewModel.worldList == null) {
      homeViewModel.queryWorlds();
      return const CircularProgressIndicator();
    }

    return WorldListPage();
  }
}

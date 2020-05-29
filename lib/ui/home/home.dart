import 'package:flutter/material.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/ui/base_list/insert_work_button.dart';
import 'package:practicemvvm/ui/base_list/work_list_router.dart';
import 'package:practicemvvm/ui/world_list/worlds_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorksViewModel>(
          create: (_) => WorldsViewModel(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('novel writer'),
          actions: <Widget>[
            InsertWorkButton(),
          ],
        ),
        body: WorkListRouterPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practicemvvm/ui/home/worlds_view_model.dart';
import 'package:practicemvvm/ui/world_list/insert_world_button.dart';
import 'package:practicemvvm/ui/world_list/world_list_page.dart';
import 'package:practicemvvm/ui/world_list/world_list_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WorldsViewModel(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('novel writer'),
          actions: <Widget>[
            InsertWorldButton(),
          ],
        ),
        body: WorldListRouterPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/ui/list_page/base_list/work_list_router.dart';
import 'package:practicemvvm/ui/list_page/world_list/worlds_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  testWidgets(
    'プログレスサークルのテスト',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<WorksViewModel>(
                create: (_) => WorldsViewModel(),
              ),
              Provider.value(
                value: (BuildContext context, dynamic value) =>
                    const Text('hoge'),
              ),
            ],
            child: WorkListRouterPage(),
          ),
        ),
      );
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'タイルのテスト',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<WorksViewModel>(
                create: (_) =>
                    WorldsViewModel()..worldList = [null, null, null],
              ),
              Provider<TileFactory>.value(
                value: (BuildContext context, dynamic value) =>
                    const Text('hoge'),
              ),
            ],
            child: WorkListRouterPage(),
          ),
        ),
      );

      expect(
        find.byType(Text),
        findsWidgets,
      );
    },
  );
}

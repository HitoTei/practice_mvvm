import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/ui/list_page/base_list/work_list_router.dart';
import 'package:provider/provider.dart';

class TestViewModel extends WorksViewModel {
  List<Work> list;

  @override
  Future<void> queryWorks() async {}

  @override
  List<Work> getWorkList() {
    return list;
  }

  @override
  Future<void> deleteWork(Work work) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertWork(String str) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateWork(Work work) {
    throw UnimplementedError();
  }
}

Future<void> main() async {
  testWidgets(
    'プログレスサークルのテスト',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<WorksViewModel>(
                create: (_) => TestViewModel(),
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
                create: (_) => TestViewModel()..list = [null, null, null],
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

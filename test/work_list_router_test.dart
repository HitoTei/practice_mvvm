import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/ui/base_list/work_list_router.dart';
import 'package:provider/provider.dart';

class TestWork extends Work {
  @override
  Widget tile(BuildContext context) {
    return const Text('hoge');
  }

  @override
  String getTableName() {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

class TestViewModel extends WorksViewModel {
  List<Work> list;

  @override
  Future<void> queryWorks() async {
    // await Future<dynamic>.delayed(const Duration(seconds: 1));
    list = [for (int i = 0; i < 10; i++) TestWork()];
  }

  @override
  List<Work> getWorkList() {
    return list;
  }

  @override
  Future<void> deleteWork(Work work) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNewWork(String str) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateWork(Work work) {
    throw UnimplementedError();
  }
}

Future<void> main() async {
  await testWidgets(
    'プログレスサークルのテスト',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider<WorksViewModel>(
                create: (_) => TestViewModel(),
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
}

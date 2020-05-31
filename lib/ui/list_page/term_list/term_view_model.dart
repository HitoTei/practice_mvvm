import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/model/work.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class TermsViewModel extends WorksViewModel {
  TermsViewModel(this.world);

  List<Term> termList = null;
  final World world;

  @override
  List<Work> getWorkList() => termList;

  @override
  Future<void> queryWorks() async {
    termList = await SqlProvider().queryWorldTermList(world.id);
    notifyListeners();
  }

  @override
  Future<void> updateWork(Work work) async {
    work.updateTime = DateTime.now();

    SqlProvider().insert<Term>(work as Term);
    notifyListeners();
  }

  @override
  Future<void> insertWork(String title) async {
    final time = DateTime.now();
    final term = Term()
      ..title = title
      ..worldId ??= world.id
      ..createTime ??= time
      ..updateTime = time;

    await SqlProvider().insert(term);
    queryWorks();
  }

  @override
  Future<void> deleteWork(Work work) async {
    await SqlProvider().delete<Term>(work as Term);
    termList.remove(work);
    notifyListeners();
  }
}

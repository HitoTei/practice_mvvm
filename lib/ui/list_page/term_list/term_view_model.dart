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
  void notifyListeners() {
    termList.sort((Term v1, Term v2) => v1.tag.compareTo(v2.tag));
    super.notifyListeners();
  }

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

  Future<void> updateTag(String oldTag, String newTag) async {
    await SqlProvider().updateTag(world.id, oldTag, newTag);
    for (final term in termList) {
      if (term.tag == oldTag) term.tag = newTag;
    }
    notifyListeners();
  }

  @override
  void sortByCreateTime({bool asc}) {
    termList.sort(
      (Term v1, Term v2) {
        if (asc)
          return v1?.createTime?.compareTo(v2.createTime) ?? 0;
        else
          return v2?.createTime?.compareTo(v1.createTime) ?? 0;
      },
    );
    notifyListeners();
  }

  @override
  void sortByTitle({bool asc}) {
    termList.sort(
      (Term v1, Term v2) {
        if (asc)
          return v1?.title?.compareTo(v2.title) ?? 0;
        else
          return v2?.title?.compareTo(v1.title) ?? 0;
      },
    );
    notifyListeners();
  }

  @override
  void sortByUpdateTime({bool asc}) {
    termList.sort(
      (Term v1, Term v2) {
        if (asc)
          return v1?.updateTime?.compareTo(v2.updateTime) ?? 0;
        else
          return v2?.updateTime?.compareTo(v1.updateTime) ?? 0;
      },
    );
    notifyListeners();
  }
}

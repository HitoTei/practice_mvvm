import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/model/work.dart';

abstract class WorksViewModel with ChangeNotifier {
  Future<void> queryWorks();

  Future<void> updateWork(Work work);

  Future<void> insertNewWork(String title);

  Future<void> deleteWork(Work work);

  List<Work> getWorkList();
}

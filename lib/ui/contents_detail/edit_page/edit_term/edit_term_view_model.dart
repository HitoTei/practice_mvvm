import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class EditTermViewModel extends EditorViewModel {
  EditTermViewModel(this.term) : _contents = term.contents;

  Term term;
  String _contents;

  @override
  Future<void> save() async {
    term
      ..contents = _contents
      ..updateTime = DateTime.now();
    SqlProvider().insert(term);
  }

  Future<void> saveTag(String tag) async {
    term
      ..tag = tag
      ..updateTime = DateTime.now();
    SqlProvider().insert(term);
  }

  @override
  String getContents() => _contents;

  @override
  void setContents(String contents) => _contents = contents;
}

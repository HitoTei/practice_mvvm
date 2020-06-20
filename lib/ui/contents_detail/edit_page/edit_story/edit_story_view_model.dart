import 'package:practicemvvm/base/editor_view_model.dart';
import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class EditStoryViewModel extends EditorViewModel {
  EditStoryViewModel(this.story) : _contents = story.contents;
  Story story;
  String _contents;

  @override
  Future<void> save() async {
    story
      ..contents = _contents
      ..updateTime = DateTime.now();
    SqlProvider().insert(story);
  }

  @override
  String getContents() => _contents;
  @override
  void setContents(String contents) => _contents = contents;
}

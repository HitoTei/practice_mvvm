import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class EditStoryViewModel {
  EditStoryViewModel(this.story) : content = story.contents;
  Story story;
  String content;
  Future<void> saveStory() async {
    story
      ..contents = content
      ..updateTime = DateTime.now();
    SqlProvider().insert(story);
  }
}

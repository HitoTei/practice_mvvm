import 'package:practicemvvm/model/story.dart';
import 'package:practicemvvm/provider/sql_provider.dart';

class EditStoryViewModel {
  EditStoryViewModel(this.story) : content = story.content;
  Story story;
  String content;
  Future<void> saveStory() async {
    story.content = content;
    SqlProvider().insert(story);
  }
}

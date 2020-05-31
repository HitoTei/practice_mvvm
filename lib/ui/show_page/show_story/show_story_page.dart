import 'package:flutter/cupertino.dart';
import 'package:practicemvvm/ui/show_page/show_story/show_story_view_model.dart';
import 'package:provider/provider.dart';

class ShowStoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        Provider.of<ShowStoryViewModel>(context, listen: false).story.content ??
            '',
      ),
    );
  }
}

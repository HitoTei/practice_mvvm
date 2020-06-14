import 'package:flutter/cupertino.dart';

class ShowContentsPage extends StatelessWidget {
  const ShowContentsPage(this.contents);
  final String contents;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          contents ?? '',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

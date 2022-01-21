import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class ShowContentsPage extends StatelessWidget {
  const ShowContentsPage(this.contents, {this.isMarkdown = false});
  final String contents;
  final bool isMarkdown;
  @override
  Widget build(BuildContext context) {
    return isMarkdown
        ? SizedBox(
            width: double.infinity,
            child: Markdown(
              data: contents ?? '',
              // styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
              ),
              selectable: true,
              extensionSet: md.ExtensionSet.gitHubFlavored,
            ),
          )
        : SingleChildScrollView(
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
    /*

    SingleChildScrollView(
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
    )
     */
  }
}

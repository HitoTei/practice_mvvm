import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practicemvvm/base/tile_factory.dart';
import 'package:practicemvvm/base/works_view_model.dart';
import 'package:practicemvvm/model/term.dart';
import 'package:practicemvvm/ui/list_page/term_list/term_view_model.dart';
import 'package:provider/provider.dart';

class TermListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WorksViewModel>(context) as TermsViewModel;
    final tileFactory = Provider.of<TileFactory>(context);
    final termList = viewModel.getWorkList() as List<Term>;

    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            if (index == 0 || termList[index].tag != termList[index - 1].tag)
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      termList[index].tag,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            tileFactory(context, termList[index]),
          ],
        );
      },
      separatorBuilder: (_, index) => const Divider(),
      itemCount: termList.length,
    );
  }
}

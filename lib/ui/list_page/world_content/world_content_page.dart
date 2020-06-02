import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practicemvvm/model/world.dart';
import 'package:practicemvvm/ui/list_page/story_list/story_home_page.dart';
import 'package:practicemvvm/ui/list_page/term_list/term_home_page.dart';

class WorldContentPage extends StatefulWidget {
  const WorldContentPage(World world) : _world = world;
  final World _world;
  @override
  _WorldContentPageState createState() => _WorldContentPageState(_world);
}

class _WorldContentPageState extends State<WorldContentPage> {
  _WorldContentPageState(World world) : _world = world;
  final World _world;

  List<Widget> _widgetOption;

  int _selectIndex = 0;

  @override
  void initState() {
    _widgetOption = [
      StoryHomePage(_world),
      TermHomePage(_world),
    ];

    super.initState();
  }

  void onChanged(int index) => setState(() => _selectIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_world.title),
      ),
      body: _widgetOption[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: const Icon(Icons.description),
            title: const Text('Story'),
          ),

          const BottomNavigationBarItem(
            icon: const Icon(Icons.storage),
            title: const Text('Term'),
          ),

        ],
        currentIndex: _selectIndex,
        onTap: onChanged,
      ),
    );
  }
}

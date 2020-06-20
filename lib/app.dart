import 'package:flutter/material.dart';
import 'package:practicemvvm/dark_mode.dart';
import 'package:practicemvvm/ui/list_page/world_list/home.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider(
      create: (_) => DarkMode(),
      child: _App(),
    );
  }
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<bool>(context);
    return MaterialApp(
      title: 'Novel Writer',
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

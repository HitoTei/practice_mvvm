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
    final darkTextTheme =
        ThemeData.dark().textTheme.apply(fontFamily: 'Noto Sans JP');
    final lightTextTheme =
        ThemeData.light().textTheme.apply(fontFamily: 'Noto Sans JP');
    final darkTheme = ThemeData.dark().copyWith(
      textTheme: darkTextTheme,
      primaryTextTheme: darkTextTheme,
    );
    final lightTheme = ThemeData.light().copyWith(
      textTheme: lightTextTheme,
      primaryTextTheme: lightTextTheme,
    );
    return MaterialApp(
      title: 'Novel Writer',
      theme: darkMode ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}

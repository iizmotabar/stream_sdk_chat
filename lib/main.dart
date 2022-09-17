import 'package:flutter/material.dart';
import 'package:stream_chat/screens/homescreen.dart';
import 'constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light(ThemeData()),
      darkTheme: AppTheme.dark(ThemeData()),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}

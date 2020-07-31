import 'package:flutter/material.dart';
import 'package:frenzy_chat_app/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      title: "Chat App",
      home: HomePage(),
    );
  }
}

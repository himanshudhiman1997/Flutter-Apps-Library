import 'package:flutter/material.dart';
import 'package:frenzy_chat_app/chat_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Frenzy Chat App'),
      ),
      body: ChatScreen()
    );
  }
}

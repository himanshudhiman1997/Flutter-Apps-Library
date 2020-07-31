import 'package:flutter/material.dart';
import 'package:frenzy_chat_app/chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _textEditingController.clear();
  }

  Widget _textComposerWidget(double height) {
    return IconTheme(
      data: IconThemeData(color: Colors.orange),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: height * 0.01),
        child: Row(
          children: <Widget>[
            Flexible(
              child: new TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmit,
              ),
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmit(_textEditingController.text)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(screenSize.height * 0.02),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: new BoxDecoration(color: Theme.of(context).cardColor),
              child: _textComposerWidget(screenSize.height),
            )
          ],
        ),
      ),
    );
  }
}

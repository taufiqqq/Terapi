import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:terapi/providers/chat_providers.dart';
import 'package:terapi/widgets/chat_widget.dart';
import 'package:terapi/widgets/text_widget.dart';

import '../../providers/models_provider.dart';
import '../../services/services.dart';

class GPTScreen extends StatefulWidget {
  const GPTScreen({super.key});

  @override
  State<GPTScreen> createState() => _GPTScreenState();
}

class _GPTScreenState extends State<GPTScreen> {
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _listScrollController;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(
      context,
    );
    final modelsProvider = Provider.of<ModelsProvider>(
      context,
    );
    

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("Chat"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModelSheet(context: context);
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              controller: _listScrollController,
              itemCount: chatProvider.getChatList.length,
              itemBuilder: (context, index) {
                return ChatWidget(
                  message: chatProvider.getChatList[index].msg,
                  chatIndex: chatProvider.getChatList[index].chatIndex,
                );
              },
            ),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.black,
              size: 18,
            ),
          ],
          const SizedBox(
            height: 15,
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.grey),
                      controller: textEditingController,
                      onSubmitted: (value) async {
                        await sendMessageFCT(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider,
                        );
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: "Enter Something",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await sendMessageFCT(
                          modelsProvider: modelsProvider,
                          chatProvider: chatProvider,
                        );
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Cant Send MUltiple Text At A Time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;

        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });

      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);

      setState(() {});
    } catch (error) {
      log("error $error");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}

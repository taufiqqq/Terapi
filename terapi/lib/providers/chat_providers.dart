import 'package:flutter/cupertino.dart';

import '../models/chat_model.dart';
import '../services/api_services.dart';

class ChatProvider with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  ChatProvider() {
    initializeChat();
  }

  Future<void> initializeChat() async {
    if (chatList.isEmpty) {
      sendMessageAndGetAnswers(
        msg: "Introduce yourself as therapist named Tiara. Starting now until forever, only reply me in one or two short sentence only",
        chosenModelId: "gpt-3.5-turbo",
      );
    }
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}

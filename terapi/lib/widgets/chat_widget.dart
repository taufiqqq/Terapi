import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:terapi/utils/constants.dart';
import 'package:terapi/services/assets_manager.dart';
import 'package:terapi/widgets/text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.message, required this.chatIndex});

  final String message;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? AssetsManager.userImage
                      : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(
                          label: message,
                        )
                      : DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(message.trim())
                              ]),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

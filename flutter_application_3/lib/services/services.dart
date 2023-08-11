import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/drop_down.dart';

import '../constants/constants.dart';
import '../widget/text_widget.dart';

class Services {
  static Future<void> showModelSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model",
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ModelsDrowDownWidget(),
                )
              ],
            ),
          );
        });
  }
}

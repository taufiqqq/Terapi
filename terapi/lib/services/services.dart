import 'package:flutter/material.dart';
import 'package:terapi/widgets/drop_down.dart';

import '../utils/constants.dart';
import '../widgets/text_widget.dart';

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

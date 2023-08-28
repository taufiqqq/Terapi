import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/dass_result_diagram.dart';
import '../../widgets/percentage_diagram.dart';
import '../../widgets/time_spent_diagram.dart';

class MyProgress extends StatelessWidget {
  const MyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Progress'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PercentageDiagram(),
            DassResultDiagram(),
            TimeSpentOnSocialMediaDiagram(),
          ],
        ),
      ),
    );
  }
}

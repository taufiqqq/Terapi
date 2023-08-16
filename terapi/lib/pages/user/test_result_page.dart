import 'package:flutter/material.dart';

class TestResult extends StatelessWidget {
  final String testName;
  final String result;

  TestResult({Key? key, required this.testName, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, ModalRoute.withName('/'));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(testName),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}

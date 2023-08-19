import 'package:cloud_firestore/cloud_firestore.dart';

enum TestCategory {
  DASS,
  Personality,
  LoveLanguage,
  Career,
}

class Test {
  final TestCategory category;
  String result = '';

  Test({
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category.toString().split('.').last,
      'result': result,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      category: TestCategory.values
          .firstWhere((e) => e.toString() == 'TestCategory.${map['category']}'),
    )..result = map['result'];
  }
}

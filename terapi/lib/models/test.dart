enum TestCategory {
  DASS,
  Personality,
  LoveLanguage,
  Career,
}

class Test {
  final TestCategory category;
  String result = ''; // String variable to store the test result

  Test({
    required this.category,
  });
}

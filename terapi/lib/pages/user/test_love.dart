import 'package:flutter/material.dart';

import '../../models/answer.dart';
import '../../models/question.dart';
import 'test_result_page.dart';

class LoveLanguageTest extends StatefulWidget {
  @override
  _LoveLanguageTestState createState() => _LoveLanguageTestState();
}

class _LoveLanguageTestState extends State<LoveLanguageTest> {
  List<Question> _questions = [
    Question(
      text: 'It means a lot to me when someone helps me with my tasks.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'I feel loved when someone gives me a hug.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'Receiving a thoughtful gift makes me feel special.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'I enjoy spending quality time with my loved ones.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'Words of affirmation and compliments mean a lot to me.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'I appreciate it when someone helps me out practically.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text:
          'Physical touch and closeness are important to me in relationships.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    Question(
      text: 'I feel loved when someone encourages me and supports my goals.',
      answers: [
        Answer(text: 'Not at all', score: 0),
        Answer(text: 'A little', score: 1),
        Answer(text: 'Somewhat', score: 2),
        Answer(text: 'Very much', score: 3),
      ],
    ),
    // Add more questions
  ];
  List<int?> _selectedAnswers = List.filled(8, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Language Test'),
      ),
      body: ListView.builder(
        itemCount: _questions.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_questions[index].text),
              subtitle: Column(
                children: _questions[index]
                    .answers
                    .map(
                      (answer) => RadioListTile<int>(
                        title: Text(answer.text),
                        value: answer.score,
                        groupValue: _selectedAnswers[index],
                        onChanged: (value) {
                          setState(() {
                            _selectedAnswers[index] = value;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedAnswers.contains(null)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please answer all questions.'),
              ),
            );
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        (TestResult(testName: 'Love Language', result: 'Words of Affirmation\nYou are more likely to get affected by words of affirmation, affection and love language from your partner'))));
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

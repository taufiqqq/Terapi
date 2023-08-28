import 'package:flutter/material.dart';

import '../../models/answer.dart';
import '../../models/question.dart';
import 'test_result_page.dart';

class DassTest extends StatefulWidget {
  @override
  _DassTestState createState() => _DassTestState();
}

class _DassTestState extends State<DassTest> {
  List<Question> _questions = [
    Question(
      text: 'I found it hard to wind down.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I was aware of dryness of my mouth.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I couldn\'t seem to experience any positive feeling at all.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text:
          'I experienced breathing difficulty (e.g. excessively rapid breathing, breathlessness in the absence of physical exertion)',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I found it difficult to work up the initiative to do things.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I felt that I had nothing to look forward to.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I felt I wasn\'t worth much as a person.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
    Question(
      text: 'I felt that I was rather touchy.',
      answers: [
        Answer(text: 'Never', score: 0),
        Answer(text: 'Sometimes', score: 1),
        Answer(text: 'Often', score: 2),
        Answer(text: 'Always', score: 3),
      ],
    ),
  ];
  List<int?> _selectedAnswers = List.filled(8, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedAnswers.contains(null)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please answer all questions.'),
              ),
            );
          } else {
            // TODO: Process the answers
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        (TestResult(testName: 'DASS', result: 'Good'))));
          }
        },
        child: Icon(Icons.send),
        shape: CircleBorder(),
      ),
      appBar: AppBar(
        title: Text('DASS Test'),
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
    );
  }
}

void main() {
  runApp(MaterialApp(home: DassTest()));
}

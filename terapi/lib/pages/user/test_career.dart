import 'package:flutter/material.dart';

import '../../models/answer.dart';
import '../../models/question.dart';

import 'test_result_page.dart';

class CareerTest extends StatefulWidget {
  @override
  _CareerTestState createState() => _CareerTestState();
}

class _CareerTestState extends State<CareerTest> {
  List<Question> _questions = [
    Question(
      text: 'I enjoy working on practical, hands-on tasks.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am motivated by helping others and making a positive impact.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I prefer working independently rather than in a team.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I have a strong desire to continuously learn and grow.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am good at handling and resolving conflicts.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I enjoy setting and achieving ambitious goals.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am comfortable taking on leadership roles.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am detail-oriented and thorough in my work.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    // Add more questions
  ];
  List<int?> _selectedAnswers = List.filled(8, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Career Test'),
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
                    builder: (context) => (TestResult(
                        testName: 'Career',
                        result:
                            'Any career that related to interaction\nFor example, consultant and product manager'))));
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CareerTest()));
}

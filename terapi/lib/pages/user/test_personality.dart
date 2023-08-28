import 'package:flutter/material.dart';

import '../../models/answer.dart';
import '../../models/question.dart';
import 'test_result_page.dart';

class PersonalityTest extends StatefulWidget {
  @override
  _PersonalityTestState createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  List<Question> _questions = [
    Question(
      text: 'I enjoy socializing with others.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I prefer routine and stability in my life.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I enjoy taking risks and trying new things.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am generally a very organized person.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am compassionate and empathetic towards others.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I enjoy working independently rather than in a team.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I often seek adventure and new experiences.',
      answers: [
        Answer(text: 'Strongly Disagree', score: 1),
        Answer(text: 'Disagree', score: 2),
        Answer(text: 'Neutral', score: 3),
        Answer(text: 'Agree', score: 4),
        Answer(text: 'Strongly Agree', score: 5),
      ],
    ),
    Question(
      text: 'I am good at keeping calm under pressure.',
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
        title: Text('Personality Test'),
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
                        (TestResult(testName: 'Personality', result: 'INFJ\nYou are an introvert\nWhile you are introvert, you should still try interact with people. Good luck !'))));
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

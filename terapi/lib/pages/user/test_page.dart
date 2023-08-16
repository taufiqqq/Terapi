import 'package:flutter/material.dart';
import 'package:terapi/pages/user/test_career.dart';
import 'package:terapi/pages/user/test_love.dart';
import 'package:terapi/pages/user/test_personality.dart';
import 'test_dass.dart';
import 'test_history_page.dart'; // Import other test files

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<TestOption> allTestOptions = [
    TestOption(
      icon: Icons.article,
      title: 'DASS Test',
      description: 'Assess your stress, anxiety, and depression levels.',
      route: DassTest(),
    ),
    TestOption(
      icon: Icons.person,
      title: 'Personality Test',
      description: 'Discover insights into your personality traits.',
      route: PersonalityTest(),
    ),
    TestOption(
      icon: Icons.favorite,
      title: 'Love Language Test',
      description: 'Learn how you express and perceive love.',
      route: LoveLanguageTest(),
    ),
    TestOption(
      icon: Icons.work,
      title: 'Career Test',
      description: 'Explore career preferences and strengths.',
      route: CareerTest(),
    ),
  ];

  List<TestOption> filteredTestOptions = [];

  @override
  void initState() {
    super.initState();
    filteredTestOptions = allTestOptions;
  }

  void _filterTestOptions(String searchText) {
    setState(() {
      filteredTestOptions = allTestOptions
          .where((option) =>
              option.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Test'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestHistoryPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterTestOptions,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTestOptions.length,
              itemBuilder: (context, index) {
                return TestOptionCard(testOption: filteredTestOptions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TestOption {
  final IconData icon;
  final String title;
  final String description;
  final Widget route;

  TestOption({
    required this.icon,
    required this.title,
    required this.description,
    required this.route,
  });
}

class TestOptionCard extends StatelessWidget {
  final TestOption testOption;

  TestOptionCard({required this.testOption});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => testOption.route),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(testOption.icon),
                title: Text(testOption.title),
                subtitle: Text(testOption.description),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Take Now',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TestPage()));
}

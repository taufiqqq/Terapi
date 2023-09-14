import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../widgets/bar_chart.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/dass_result_diagram.dart';
import '../../widgets/percentage_diagram.dart';
import '../../widgets/time_spent_diagram.dart';

class MyProgress extends StatelessWidget {
  MyProgress({super.key});

  final double initialPercentage = 40.0;
  final double improvedPercentage = 60.0;

  final Map<String, double> dataMap = {
    "Improvement": 60.0,
    "Remaining": 40.0,
  };

  final List<Color> colorList = [
    Colors.blue,
    Colors.grey.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Progress'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: 400 / 3.2, // Adjust this if needed
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText:
                    "$improvedPercentage%", // Display the improved percentage
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle, // Use BoxShape.circle directly
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
            ),
            Text('Your Are Doing Better!',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Your Emotion',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color:
                    Colors.blue.shade700, // Background color for the entire row
                padding: EdgeInsets.symmetric(
                    vertical: 16), // Adjust padding as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColumn("😢", "Depressed", "June"),
                    _buildColumn("😐", "Neutral", "July"),
                    _buildColumn("😄", "Happy", "August"),
                    _buildColumn("😄", "Happy", "September"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(
                    colors: [
                      const Color.fromARGB(255, 255, 60, 0),
                      const Color.fromARGB(255, 200, 70, 31),
                      Color.fromARGB(255, 229, 255, 0),
                      Color.fromARGB(255, 86, 255, 34),
                    ],
                    title: 'Time Spent on Social Media (hours per month)',
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 20, horizontal: 10), // Adjust margin as needed
              padding: EdgeInsets.all(16), // Adjust padding as needed
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 0, 140, 255), // Background color of the card
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 100,
                          child: Image(
                            image: AssetImage("lib/assets/img/logo.png"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text('Tiara, AI powered therapist',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  SizedBox(height: 10),
                  Text(
                    "Suggestion",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Remember to reach out to friends, family, or a professional for support. Incorporate a balanced diet with plenty of fruits, vegetables, and whole grains for improved well-being. Your DASS test result is improving, and as your therapist comment, implementing an Islamic and stoic lifestyle will help you clear some problem in your mind",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "-Tiara (AI powered therapist)",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buildColumn(String emoji, String state, String month) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade900, // Darker shade for the emoji container
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            emoji,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Text(
          state,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          month,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}

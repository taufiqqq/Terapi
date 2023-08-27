import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TherapistMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Monthly Income',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 200, // Set a fixed height for the BarChart
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                        toY:
                            1000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY:
                            1500, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY:
                            1000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY:
                            1500, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        toY:
                            1000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        toY:
                            2000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                        toY:
                            200, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                        toY:
                            1500, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                        toY:
                            1000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                        toY:
                            500, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                        toY:
                            1000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                        toY:
                            2000, // Placeholder value, you can replace this with actual income data
                        color: Colors.blue,
                      ),
                    ]),
                  ],
                  titlesData: FlTitlesData(show: false),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This Month Income',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 200, // Set a fixed height for the visualization
              color: Color.fromARGB(255, 17, 255, 0),
              child: Center(
                child: Text(
                  '\$2000',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

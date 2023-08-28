import 'package:flutter/material.dart';

const defaultSpacing = 16.0;

class BarChart extends StatelessWidget {
  const BarChart(
      {Key? key,
      this.colors,
      this.values = const [577.7, 360.1, 184.1, 105.4],
      required this.title})
      : super(key: key);

  final List<Color>? colors;
  final List<double> values;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(title),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final barWidth =
                    (constraints.maxWidth - defaultSpacing * values.length) /
                        values.length;
                return CustomPaint(
                  size: Size(constraints.maxWidth, 200),
                  painter: BarChartPainter(
                    values: values,
                    colors: colors ??
                        List<int>.generate(values.length, (i) => i + 1).map(
                          (e) {
                            final opacity = e / values.length;
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(opacity);
                          },
                        ).toList(),
                    barWidth: barWidth,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  BarChartPainter({
    required this.values,
    required this.colors,
    this.barWidth = 24.0,
  });

  final List<double> values;
  final List<Color> colors;
  final double barWidth;

  @override
  void paint(Canvas canvas, Size size) {
    // Find the maximum value in the list of values.
    double max = values.reduce((a, b) => a > b ? a : b);

    // Paint object for drawing the axes.
    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0;

    // Draw the y-axis.
    canvas.drawLine(
      const Offset(0, 0),
      Offset(0, size.height),
      axisPaint,
    );

    // Draw the x-axis.
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      axisPaint,
    );

    // Loop through each value and draw a bar for it.
    for (int i = 0; i < values.length; i++) {
      // Paint object for drawing the bar.
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      // Calculate the total space for each bar, including the space between bars.
      final totalSpace = barWidth + defaultSpacing;
      // Calculate the height of the bar based on its value.
      final barHeight = values[i] / max * (size.height - defaultSpacing);
      // Calculate the left position of the bar to center it within its allocated
      // space.
      final barLeft = i * totalSpace + totalSpace / 2 - barWidth / 2;

      // Create a rectangle representing the bar.
      final barRect = Rect.fromLTWH(
        barLeft,
        size.height - barHeight,
        barWidth,
        barHeight,
      );

      // Draw the bar on the canvas.
      canvas.drawRect(barRect, paint);

      // Create a TextPainter for drawing the label.
      final labelPainter = TextPainter(
        text: TextSpan(
          text: '${(values[i])}',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        textDirection: TextDirection.ltr,
      );

      // Layout the text and paint it on the canvas.
      labelPainter.layout();
      labelPainter.paint(
        canvas,
        Offset(
          i * (barWidth + defaultSpacing) + (barWidth / 2 - defaultSpacing / 2),
          size.height,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

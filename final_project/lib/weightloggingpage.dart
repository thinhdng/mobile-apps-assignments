import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeightLoggingPage extends StatefulWidget {
  const WeightLoggingPage({super.key});

  @override
  State<WeightLoggingPage> createState() => _WeightLoggingPageImplementation();
}

List<FlSpot> chartData = [
  const FlSpot(0, 1),
  const FlSpot(1, 3),
  const FlSpot(2, 10),
  const FlSpot(3, 7),
  const FlSpot(4, 12),
  const FlSpot(5, 13),
  const FlSpot(6, 17),
  const FlSpot(7, 15),
  const FlSpot(8, 20),
];

class _WeightLoggingPageImplementation extends State<WeightLoggingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weight Tracker'),
        ),
        body: LineChart(LineChartData(
          borderData: FlBorderData(show: false),
          lineBarsData: [LineChartBarData(spots: chartData)],
        )));
  }
}

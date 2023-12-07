import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'createrecord.dart';

class WeightLoggingPage extends StatefulWidget {
  const WeightLoggingPage({super.key});

  @override
  State<WeightLoggingPage> createState() => _WeightLoggingPageImplementation();
}

class _WeightLoggingPageImplementation extends State<WeightLoggingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
      ),
      body: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // ignore: prefer_const_constructors
              CreateRecord();
            }),
        body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(),
          series: <ChartSeries<DateAndWeight, String>>[
            LineSeries<DateAndWeight, String>(
              dataSource: chartData,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              markerSettings: const MarkerSettings(isVisible: true),
              xValueMapper: (DateAndWeight data, _) => data.date,
              yValueMapper: (DateAndWeight data, _) => data.weight,
            )
          ],
        ),
      ),
    );
  }
}

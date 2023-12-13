import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class WeightLoggingPage extends StatefulWidget {
  const WeightLoggingPage({super.key});
  static TextEditingController weightinput = TextEditingController();
  static TextEditingController dateinput = TextEditingController();
  static double weightValue = 0.0;
  @override
  State<WeightLoggingPage> createState() => _WeightLoggingPageImplementation();
}

DateTime dateToChoose = DateTime.now();
List<DateAndWeight> chartData = [];

class DateAndWeight {
  DateTime date;
  double weight;

  DateAndWeight(this.date, this.weight);
}

class _WeightLoggingPageImplementation extends State<WeightLoggingPage> {
  ChartSeriesController? chartSeriesController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat('MM-dd-yyyy'),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 2),
              primaryYAxis: NumericAxis(),
              series: <ChartSeries>[
                LineSeries<DateAndWeight, DateTime>(
                  onRendererCreated: (ChartSeriesController controller) {
                    chartSeriesController = controller;
                  },
                  dataSource: chartData,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  markerSettings: const MarkerSettings(isVisible: true),
                  xValueMapper: (DateAndWeight data, _) => data.date,
                  yValueMapper: (DateAndWeight data, _) => data.weight,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
              backgroundColor: Colors.blue,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          height: 200,
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              const Text(
                                "Create a new record:",
                                textAlign: TextAlign.start,
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Weight',
                                ),
                                keyboardType: TextInputType.number,
                                controller: WeightLoggingPage.weightinput,
                              ),
                              TextField(
                                controller: WeightLoggingPage.dateinput,
                                decoration: const InputDecoration(
                                    icon: Icon(Icons.calendar_today),
                                    labelText: 'Enter Date'),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    setState(() {
                                      WeightLoggingPage.dateinput.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      dateToChoose = DateTime.parse(
                                          WeightLoggingPage.dateinput.text);
                                    });
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel')),
                                  TextButton(
                                      onPressed: () {
                                        if (WeightLoggingPage
                                            .weightinput.text.isNotEmpty) {
                                          WeightLoggingPage.weightValue =
                                              double.parse(WeightLoggingPage
                                                  .weightinput.text);
                                          WeightLoggingPage.weightinput.clear();
                                          Navigator.pop(context);
                                          chartData.add(DateAndWeight(
                                              dateToChoose,
                                              WeightLoggingPage.weightValue));
                                          chartData.sort((a, b) =>
                                              a.date.compareTo(b.date));
                                          chartSeriesController
                                              ?.updateDataSource(
                                                  addedDataIndexes: <int>[
                                                chartData.length - 1
                                              ]);
                                        } else {
                                          null;
                                        }
                                      },
                                      child: const Text('Submit')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ]),
    );
  }
}

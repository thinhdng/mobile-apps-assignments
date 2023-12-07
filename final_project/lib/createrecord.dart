import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateRecord extends StatefulWidget {
  const CreateRecord({super.key});

  @override
  State<CreateRecord> createState() => _CreateRecordImplementation();
}

class _CreateRecordImplementation extends State<CreateRecord> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<DateAndWeight> chartData = [
  DateAndWeight(formattedDate, 236.5),
  DateAndWeight('Jan 15, 2024', 361.5)
];

class DateAndWeight {
  String date;
  double weight;

  DateAndWeight(this.date, this.weight);
}

DateTime today = DateTime.now();
String formattedDate = DateFormat.yMMMd('en_US').format(today);

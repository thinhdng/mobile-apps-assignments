import 'package:flutter/material.dart';

class ReviewBodyInput extends StatefulWidget {
  const ReviewBodyInput({super.key});

  @override
  State<ReviewBodyInput> createState() => _ReviewBodyInputImplementation();
}

class _ReviewBodyInputImplementation extends State<ReviewBodyInput> {
  final _reviewbodytext = '';

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'Review in details'),
    );
  }
}

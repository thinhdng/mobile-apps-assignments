// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class ReviewBodyInput extends StatefulWidget {
  const ReviewBodyInput({super.key});
  static TextEditingController mycontroller = TextEditingController();
  @override
  State<ReviewBodyInput> createState() => _ReviewBodyInputImplementation();
}

class _ReviewBodyInputImplementation extends State<ReviewBodyInput> {
  @override
  void clear() {
    ReviewBodyInput.mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'Review in details'),
        controller: ReviewBodyInput.mycontroller);
  }
}

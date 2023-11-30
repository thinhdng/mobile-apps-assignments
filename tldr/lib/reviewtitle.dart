// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class ReviewTitleInput extends StatefulWidget {
  const ReviewTitleInput({super.key});
  static TextEditingController mycontroller = TextEditingController();
  @override
  State<ReviewTitleInput> createState() => _ReviewTitleInputImplementation();
}

class _ReviewTitleInputImplementation extends State<ReviewTitleInput> {
  @override
  void clear() {
    ReviewTitleInput.mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Review title'),
      controller: ReviewTitleInput.mycontroller,
    );
  }
}

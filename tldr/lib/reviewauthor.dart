// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class ReviewAuthorInput extends StatefulWidget {
  const ReviewAuthorInput({super.key});
  static TextEditingController mycontroller = TextEditingController();
  @override
  State<ReviewAuthorInput> createState() => _ReviewAuthorInputImplementation();
}

class _ReviewAuthorInputImplementation extends State<ReviewAuthorInput> {
  @override
  void clear() {
    ReviewAuthorInput.mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: 'Reviewer'),
        controller: ReviewAuthorInput.mycontroller);
  }
}

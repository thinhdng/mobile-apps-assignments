import 'package:flutter/material.dart';

class ReviewTitleInput extends StatefulWidget {
  const ReviewTitleInput({super.key});

  @override
  State<ReviewTitleInput> createState() => _ReviewTitleInputImplementation();
}

class _ReviewTitleInputImplementation extends State<ReviewTitleInput> {
  final _reviewtitletext = '';

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          border: OutlineInputBorder(), hintText: 'Review title'),
    );
  }
}

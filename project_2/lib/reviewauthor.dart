import 'package:flutter/material.dart';

class ReviewAuthorInput extends StatefulWidget {
  const ReviewAuthorInput({super.key});

  @override
  State<ReviewAuthorInput> createState() => _ReviewAuthorInputImplementation();
}

class _ReviewAuthorInputImplementation extends State<ReviewAuthorInput> {
  final _reviewauthor = '';

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: 'Reviewer'),
    );
  }
}

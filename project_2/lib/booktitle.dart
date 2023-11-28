import 'package:flutter/material.dart';

class BookTitleInput extends StatefulWidget {
  const BookTitleInput({super.key});

  @override
  State<BookTitleInput> createState() => _BookTitleInputImplementation();
}

class _BookTitleInputImplementation extends State<BookTitleInput> {
  final _booktitletext = '';
  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: 'Book'),
    );
  }
}

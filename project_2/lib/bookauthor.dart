import 'package:flutter/material.dart';

class BookAuthorInput extends StatefulWidget {
  const BookAuthorInput({super.key});

  @override
  State<BookAuthorInput> createState() => _BookAuthorInputImplementation();
}

class _BookAuthorInputImplementation extends State<BookAuthorInput> {
  final _bookauthortext = '';

  @override
  Widget build(BuildContext context) {
    return const TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: 'Author'),
    );
  }
}

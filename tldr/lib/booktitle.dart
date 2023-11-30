// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class BookTitleInput extends StatefulWidget {
  const BookTitleInput({super.key});
  static TextEditingController mycontroller = TextEditingController();
  @override
  State<BookTitleInput> createState() => _BookTitleInputImplementation();
}

class _BookTitleInputImplementation extends State<BookTitleInput> {
  @override
  void clear() {
    BookTitleInput.mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          const InputDecoration(border: OutlineInputBorder(), hintText: 'Book'),
      controller: BookTitleInput.mycontroller,
    );
  }
}

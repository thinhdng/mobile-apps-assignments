// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';

class BookAuthorInput extends StatefulWidget {
  const BookAuthorInput({super.key});
  static TextEditingController mycontroller = TextEditingController();
  @override
  State<BookAuthorInput> createState() => _BookAuthorInputImplementation();
}

class _BookAuthorInputImplementation extends State<BookAuthorInput> {
  @override
  void clear() {
    BookAuthorInput.mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: 'Author'),
      controller: BookAuthorInput.mycontroller,
    );
  }
}

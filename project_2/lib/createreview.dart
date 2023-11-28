import 'package:flutter/material.dart';
import 'booktitle.dart';
import 'bookauthor.dart';
import 'reviewauthor.dart';
import 'reviewbody.dart';
import 'reviewtitle.dart';

class CreateNewReviewPage extends StatelessWidget {
  const CreateNewReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TLDR: Book Reviews'),
      ),
      body: const Column(children: [
        BookTitleInput(),
        BookAuthorInput(),
        ReviewAuthorInput(),
        ReviewTitleInput(),
        ReviewBodyInput()
      ]),
    );
  }
}

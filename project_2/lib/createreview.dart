import 'package:flutter/material.dart';
import 'booktitle.dart';
import 'bookauthor.dart';
import 'reviewauthor.dart';
import 'reviewbody.dart';
import 'reviewtitle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';

class CreateNewReviewPage extends StatelessWidget {
  const CreateNewReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TLDR: Book Reviews'),
      ),
      body: ListView(children: const [
        SubmitButton(),
        BookTitleInput(),
        BookAuthorInput(),
        ReviewAuthorInput(),
        ReviewTitleInput(),
        ReviewBodyInput(),
      ]),
    );
  }
}

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonImplementation();
}

class _SubmitButtonImplementation extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () => submitReview(
                BookTitleInput.mycontroller.text.toString(),
                BookAuthorInput.mycontroller.text.toString(),
                ReviewAuthorInput.mycontroller.text.toString(),
                ReviewTitleInput.mycontroller.text.toString(),
                ReviewBodyInput.mycontroller.text.toString()),
            style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 20)),
            child: const Text('Submit')),
      ],
    );
  }

  Future<void> submitReview(String title, String author, String reviewer,
      String reviewtitle, String reviewtext) async {
    final response =
        await http.post(Uri.parse('https://api.restpoint.io/api/book'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'x-endpoint-key': '84afd7c94c40453bacee7e66833638d5',
              'accept': 'application/json'
            },
            body: jsonEncode(<String, String>{
              "id": const Uuid().v8(),
              "title": title,
              "author": author,
              "reviewer": reviewer,
              "reviewtitle": reviewtitle,
              "reviewtext": reviewtext
            }));
    if (response.statusCode == 200) {
      print('return a widget notifying that the request is successful ');
    }
  }
}

class Review {
  final String bookauthor;
  final String booktitle;
  final String reviewauthor;
  final String reviewbody;
  final String reviewtitle;
  const Review(
      {required this.booktitle,
      required this.bookauthor,
      required this.reviewauthor,
      required this.reviewtitle,
      required this.reviewbody});

  factory Review.fromJson(Map<String, String> json) {
    return switch (json) {
      {
        "title": String booktitle,
        "author": String bookauthor,
        "reviewer": String reviewauthor,
        "reviewtitle": String reviewtitle,
        "reviewtext": String reviewbody
      } =>
        Review(
          booktitle: booktitle,
          bookauthor: bookauthor,
          reviewauthor: reviewauthor,
          reviewtitle: reviewtitle,
          reviewbody: reviewbody,
        ),
      _ => throw const FormatException('Failed to load review')
    };
  }
}

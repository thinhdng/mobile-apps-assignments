// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'booktitle.dart';
import 'bookauthor.dart';
import 'reviewauthor.dart';
import 'reviewbody.dart';
import 'reviewtitle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                BookTitleInput.mycontroller.text,
                BookAuthorInput.mycontroller.text,
                ReviewAuthorInput.mycontroller.text,
                ReviewTitleInput.mycontroller.text,
                ReviewBodyInput.mycontroller.text),
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
              'Content-Type': 'application/json; charset=UTF-8',
              'x-endpoint-key': '84afd7c94c40453bacee7e66833638d5'
            },
            body: jsonEncode(<String, String>{
              'title': title,
              'author': author,
              'reviewer': reviewer,
              'reviewtitle': reviewtitle,
              'reviewtext': reviewtext
            }));

    if (response.statusCode == 201) {
      //return Review.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      print('post');
    } else {
      throw Exception('Failed to create review');
    }
  }
}

/*class Review {
  final String bookauthor;
  final String booktitle;
  final String reviewauthor;
  final String reviewbody;
  final String reviewtitle;
  const Review(
      {required this.bookauthor,
      required this.booktitle,
      required this.reviewauthor,
      required this.reviewbody,
      required this.reviewtitle});

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
            bookauthor: bookauthor,
            booktitle: booktitle,
            reviewauthor: reviewauthor,
            reviewbody: reviewbody,
            reviewtitle: reviewtitle),
      _ => throw const FormatException('Failed to load review')
    };
  }
}*/

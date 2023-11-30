// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'booktitle.dart';
import 'bookauthor.dart';
import 'reviewauthor.dart';
import 'reviewbody.dart';
import 'reviewtitle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';

bool isVisible = false;

class CreateNewReviewPage extends StatelessWidget {
  const CreateNewReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new review:'),
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
                ReviewBodyInput.mycontroller.text.toString(),
                context),
            style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                textStyle: const TextStyle(fontSize: 20)),
            child: const Text('Submit')),
      ],
    );
  }

  Future<dynamic> submitReview(String title, String author, String reviewer,
      String reviewtitle, String reviewtext, BuildContext context) async {
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
      BookTitleInput.mycontroller.clear();
      BookAuthorInput.mycontroller.clear();
      ReviewAuthorInput.mycontroller.clear();
      ReviewTitleInput.mycontroller.clear();
      ReviewBodyInput.mycontroller.clear();
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              'Review created successfully!',
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

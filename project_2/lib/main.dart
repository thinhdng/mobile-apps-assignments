import 'package:flutter/material.dart';
import 'createreview.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('TLDR: Book Reviews'),
                  ),
                  floatingActionButton: FloatingActionButton(
                      heroTag: 'newreviewtag',
                      tooltip: 'Create a new review',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateNewReviewPage()));
                      },
                      child: const Icon(Icons.create)),
                  body: const DisplayReviews(),
                )));
  }
}

class DisplayReviews extends StatefulWidget {
  const DisplayReviews({super.key});
  @override
  State<DisplayReviews> createState() => _DisplayReviewImplementation();
}

class _DisplayReviewImplementation extends State<DisplayReviews> {
  static List<Review> _reviewList = List<Review>.empty();
  Future<void> fetchReview() async {
    final response = await http
        .get(Uri.parse('https://api.restpoint.io/api/book'), headers: {
      "x-endpoint-key": "84afd7c94c40453bacee7e66833638d5",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    final List<Review> reviewList = (json.decode(response.body)['data'] as List)
        .map((data) => Review.fromJson(data))
        .toList();

    setState(() => _reviewList = reviewList);
  }

  @override
  Widget build(BuildContext context) {
    fetchReview();
    return ListView.builder(
        itemCount: _reviewList.length,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              padding: const EdgeInsets.all(16),
            ),
            child: Text('Review of: ${_reviewList[index].title}'),
          );
        });
  }
}

class Review {
  final String title;
  final String author;
  final String reviewer;
  final String reviewtitle;
  final String reviewtext;
  Review({
    required this.title,
    required this.author,
    required this.reviewer,
    required this.reviewtitle,
    required this.reviewtext,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        title: json['title'],
        author: json['author'],
        reviewer: json['reviewer'],
        reviewtitle: json['reviewtitle'],
        reviewtext: json['reviewtext']);
  }
}

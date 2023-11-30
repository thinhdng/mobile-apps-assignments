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
      'accept': 'application/json',
    });
    final List<Review> reviewList = (json.decode(response.body)['data'] as List)
        .map((data) => Review.fromJson(data))
        .toList();

    setState(() => _reviewList = reviewList);
  }

  @override
  Widget build(BuildContext context) {
    fetchReview();
    return Hero(
      tag: "viewingareview",
      child: ListView.builder(
          itemCount: _reviewList.length,
          itemBuilder: (BuildContext context, int index) {
            return TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Hero(
                              tag: "viewingareview",
                              child: Scaffold(
                                appBar: AppBar(
                                    title: const Text('Viewing a review')),
                                body: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        'Book: ${_reviewList[index].title}',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Author: ${_reviewList[index].author} ',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Reviewer: ${_reviewList[index].reviewer}',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Review Title: ${_reviewList[index].reviewtitle} ',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        'Review: ${_reviewList[index].reviewtext}',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )));
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                padding: const EdgeInsets.all(16),
              ),
              child: Text('Review of: ${_reviewList[index].title}'),
            );
          }),
    );
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

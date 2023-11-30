import 'dart:async';
import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> fetchReview() async {
  final response =
      await http.get(Uri.parse('https://api.restpoint.io/api/book'), headers: {
    "x-endpoint-key": "84afd7c94c40453bacee7e66833638d5",
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });
  final List<Review> list = (json.decode(response.body)['data'] as List)
      .map((data) => Review.fromJson(data))
      .toList();
  print(list[50].title);
}

void main() {
  fetchReview();
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

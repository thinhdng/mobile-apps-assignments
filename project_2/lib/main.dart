import 'package:flutter/material.dart';
import 'createreview.dart';

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
                  body: const Text(''),
                )));
  }
}

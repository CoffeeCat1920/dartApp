import 'package:book/pages/template_page.dart';
import 'package:flutter/material.dart';

Future<void> _openChapter(int pageNo) async {
  print(pageNo);
}

class ChapterPage extends StatelessWidget {
  final String bookTitle;
  final Map<String, dynamic> chapters;

  const ChapterPage({
    super.key,
    required this.bookTitle,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(bookTitle));
  }
}

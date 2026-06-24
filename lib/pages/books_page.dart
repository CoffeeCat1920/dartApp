import 'dart:convert';
import 'package:book/pages/chapter_page.dart';
import 'package:book/pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<String>> _loadBookNames() async {
  final raw = await rootBundle.loadString('assets/books/list.json');
  return List<String>.from(jsonDecode(raw));
}

Future<void> _loadBook(BuildContext context, String bookName) async {
  final raw = await rootBundle.loadString(
    'assets/books/$bookName/config.json',
  ); // ← fixed path
  final Map<String, dynamic> data = jsonDecode(raw);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          ChapterPage(bookTitle: bookName, data : data),
    ),
  );
}

final _bookNamesFuture = _loadBookNames();

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _bookNamesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('${snapshot.error}'));
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return TemplatePage(
          title: "Books",
          options: snapshot.data!,
          onOptionTap: (bookName) =>
              _loadBook(context, bookName), // ← pass context
        );
      },
    );
  }
}

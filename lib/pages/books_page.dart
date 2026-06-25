import 'dart:convert';
import 'package:book/data/book_content.dart';
import 'package:book/pages/chapter_page.dart';
import 'package:book/pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<BookContent>> _loadBookNames() async {
  final raw = await rootBundle.loadString('assets/books/list.json');
  final decoded = jsonDecode(raw) as List;

  final List<BookContent> books = decoded
      .map((e) => BookContent.fromJson(e as Map<String, dynamic>))
      .toList();

  return books;
}

Future<void> _loadBook(BuildContext context, String bookName) async {
  final raw = await rootBundle.loadString(
    'assets/books/$bookName/config.json',
  ); // ← fixed path
  final Map<String, dynamic> data = jsonDecode(raw);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChapterPage(bookTitle: bookName, data: data),
    ),
  );
}

final _bookNamesFuture = _loadBookNames();

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookContent>>(
      future: _bookNamesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('${snapshot.error}'));
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return TemplatePage(
          title: "کتاب",
          options: snapshot.data!,
          onOptionTap: (bookName) =>
              _loadBook(context, bookName), // ← pass context
        );
      },
    );
  }
}

import 'dart:convert';
import 'package:book/data/book_content.dart';
import 'package:book/pages/pdf_page.dart';
import 'package:book/pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<BookContent>> _loadBookNames(String author) async {
  final raw = await rootBundle.loadString('assets/books/$author/list.json');
  final decoded = jsonDecode(raw) as List;

  final List<BookContent> books = decoded
      .map((e) => BookContent.fromJson(e as Map<String, dynamic>))
      .toList();

  return books;
}

Future<void> _loadBook(BuildContext context, String authorName, String bookName) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          PdfPage(assetPath: 'assets/books/$bookName/book.pdf', pageNo: 1),
    ),
  );
}


class BookPage extends StatelessWidget {

  final String authorName;

  const BookPage({super.key, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookContent>>(
      future: _loadBookNames(authorName),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('${snapshot.error}'));
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return TemplatePage(
          title: "کتاب",
          options: snapshot.data!,
          onOptionTap: (bookName) =>
              _loadBook(context, authorName, bookName), // ← pass context
        );
      },
    );
  }
}

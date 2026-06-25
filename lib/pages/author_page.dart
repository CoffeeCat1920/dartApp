import 'dart:convert';
import 'package:book/data/author_content.dart';
import 'package:book/pages/author_template_page.dart';
import 'package:book/pages/chapter_page.dart';
import 'package:book/pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<AuthorContent>> _loadAuthorNames() async {
  final raw = await rootBundle.loadString('assets/books/list.json');
  final decoded = jsonDecode(raw) as List;

  final List<AuthorContent> authors = decoded
      .map((e) => AuthorContent.fromJson(e as Map<String, dynamic>))
      .toList();

  return authors;
}

Future<void> _loadBooks(BuildContext context, String bookName) async {
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

final _bookNamesFuture = _loadAuthorNames();

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AuthorContent>>(
      future: _bookNamesFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('${snapshot.error}'));
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return AuthorTemplatePage(
          title: "کتاب",
          options: snapshot.data!,
          onOptionTap: (bookName) =>
              _loadBooks(context, bookName), // ← pass context
        );
      },
    );
  }
}

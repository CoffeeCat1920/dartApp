import 'dart:convert';
import 'package:book/data/author_content.dart';
import 'package:book/pages/author_template_page.dart';
import 'package:book/pages/books_page.dart';
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

Future<void> _loadAuthor(BuildContext context, String authorName) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BookPage(authorName: authorName),
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
          onOptionTap: (authorName) =>
              _loadAuthor(context, authorName), // ← pass context
        );
      },
    );
  }
}

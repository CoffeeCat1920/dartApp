import 'package:book/pages/chap_template_page.dart';
import 'package:book/pages/pdf_page.dart';
import 'package:flutter/material.dart';

Future<void> _openChapter(BuildContext context, String bookName, int pageNo) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PdfPage (
        assetPath: 'assets/books/$bookName/book.pdf',
        pageNo: pageNo,
      ),
    ),
  );
}

Map<String, int> _mapChapters(Map<String, dynamic> data) {
  List<dynamic> chapters = data['chapters'];
  Map<String, int> chapMap = {
    for ( var chapter in chapters ) 
      chapter["name"] as String : chapter["page"] as int
  };
  return chapMap;
}


class ChapterPage extends StatelessWidget {
  final String bookTitle;
  final Map<String, dynamic> data;

  const ChapterPage({
    super.key,
    required this.bookTitle,
    required this.data,
  });
  

  @override
  Widget build(BuildContext context) {
    final Map<String, int> chapMap = _mapChapters(data);
    return ChapterTemplatePage(title: bookTitle, options: chapMap, onOptionTap: (name, page) => _openChapter(context, bookTitle, page),);
  }
}

import 'package:pdfx/pdfx.dart';
import 'package:flutter/material.dart';

class PdfPage extends StatefulWidget {
  final String assetPath;
  final int pageNo;
  final String bookTitle;

  const PdfPage({super.key, required this.assetPath, required this.pageNo, required this.bookTitle});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  late PdfController _controller;  // ← PdfController, not PdfControllerPinch

  @override
  void initState() {
    super.initState();
    _controller = PdfController(
      document: PdfDocument.openAsset(widget.assetPath),
      initialPage: widget.pageNo,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bookTitle)),
      body: PdfView(           
        controller: _controller,
        scrollDirection: Axis.vertical,
      ),
    );
 }
}

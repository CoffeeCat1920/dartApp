import 'package:book/widgets/chap_option_list.dart';
import 'package:book/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class ChapterTemplatePage extends StatelessWidget {
  final String title;
  final Map<String, int> options;
  final void Function(String, int)? onOptionTap;

  const ChapterTemplatePage({
    super.key,
    required this.title,
    required this.options,
    this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: ChapterOptionsList(options: options, onTap: onOptionTap),
    );
  }
}

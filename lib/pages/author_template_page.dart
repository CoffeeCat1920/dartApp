import 'package:book/data/author_content.dart';
import 'package:book/widgets/author_option_list.dart';
import 'package:book/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class AuthorTemplatePage extends StatelessWidget {
  final String title;
  final List<AuthorContent> options;
  final void Function(String)? onOptionTap;

  const AuthorTemplatePage({
    super.key,
    required this.title,
    required this.options,
    this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: MyAppBar(title: title,),
      body: AuthorOptionsList(options: options, onTap: onOptionTap),
    );
  }
}

import 'package:book/widgets/options_list.dart';
import 'package:book/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  final String title;
  final List<String> options;
  final void Function(String)? onOptionTap;

  const TemplatePage({
    super.key,
    required this.title,
    required this.options,
    this.onOptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: OptionsList(options: options, onTap: onOptionTap),
    );
  }
}

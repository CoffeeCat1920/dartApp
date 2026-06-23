import 'package:flutter/material.dart';

class ChapterOptionsList extends StatelessWidget {
  final List<String> options;
  final void Function(String)? onTap;

  const ChapterOptionsList({super.key, required this.options, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(options[index]),
        onTap: () => onTap?.call(options[index]),
      ),
    );
  }
}

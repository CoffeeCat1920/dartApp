import 'package:flutter/material.dart';

class ChapterOptionsList extends StatelessWidget {
  final Map<String, int> options;
  final void Function(String, int)? onTap;

  const ChapterOptionsList({super.key, required this.options, this.onTap});

  @override
  Widget build(BuildContext context) {
    final entries = options.entries.toList(); // ← convert to indexable list

    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        return ListTile(
          title: Text(entry.key), // ← chapter name
          onTap: () => onTap?.call(entry.key, entry.value), // ← name, page
        );
      },
    );
  }
}

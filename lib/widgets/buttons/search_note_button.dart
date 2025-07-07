import 'package:flutter/material.dart';

class SearchNoteButton extends StatelessWidget {
  const SearchNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.search, size: 40, color: Colors.white),
      ),
    );
  }
}

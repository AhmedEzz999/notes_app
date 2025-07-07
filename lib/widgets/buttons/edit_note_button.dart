import 'package:flutter/material.dart';

class EditNoteButton extends StatelessWidget {
  const EditNoteButton({super.key});

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
        child: const Icon(
          Icons.check_circle_outline,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}

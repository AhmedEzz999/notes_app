import 'package:flutter/material.dart';

class DeleteNoteButton extends StatelessWidget {
  const DeleteNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: const Icon(Icons.delete, size: 40, color: Colors.black),
    );
  }
}

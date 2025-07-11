import 'package:flutter/material.dart';

class DeleteNoteButton extends StatelessWidget {
  final void Function()? onPressed;
  const DeleteNoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      icon: const Icon(Icons.delete, size: 40, color: Colors.black),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.kPrimaryColor,
      minLines: 6,
      maxLines: 6,
      decoration: InputDecoration(
        hint: const Text(
          'Note',
          style: TextStyle(fontSize: 25, color: AppColors.kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
    );
  }
}

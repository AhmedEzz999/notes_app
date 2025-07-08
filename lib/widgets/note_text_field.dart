import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class NoteTextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  const NoteTextField({super.key, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      onSaved: onSaved,
      cursorColor: AppColors.kPrimaryColor,
      minLines: 5,
      maxLines: 5,
      style: const TextStyle(fontSize: 24, color: Colors.white),
      decoration: InputDecoration(
        hint: const Text(
          'Note',
          style: TextStyle(fontSize: 25, color: AppColors.kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
    );
  }
}

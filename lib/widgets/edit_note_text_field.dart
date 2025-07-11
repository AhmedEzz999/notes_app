import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

class EditNoteTextField extends StatefulWidget {
  final NoteModel note;
  final void Function(String?)? onSaved;
  const EditNoteTextField({
    super.key,
    required this.onSaved,
    required this.note,
  });

  @override
  State<EditNoteTextField> createState() => _EditNoteTextFieldState();
}

class _EditNoteTextFieldState extends State<EditNoteTextField> {
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.note.note);
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _noteController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      onSaved: widget.onSaved,
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

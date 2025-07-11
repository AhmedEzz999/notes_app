import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';

class EditTitleTextField extends StatefulWidget {
  final NoteModel note;
  final void Function(String?)? onSaved;
  const EditTitleTextField({
    super.key,
    required this.onSaved,
    required this.note,
  });

  @override
  State<EditTitleTextField> createState() => _EditTitleTextFieldState();
}

class _EditTitleTextFieldState extends State<EditTitleTextField> {
  late TextEditingController _titleNoteController;

  @override
  void initState() {
    super.initState();
    _titleNoteController = TextEditingController(text: widget.note.noteTitle);
  }

  @override
  void dispose() {
    _titleNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleNoteController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      onSaved: widget.onSaved,
      cursorColor: AppColors.kPrimaryColor,
      style: const TextStyle(fontSize: 24, color: Colors.white),
      decoration: InputDecoration(
        hint: const Text(
          'Title',
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

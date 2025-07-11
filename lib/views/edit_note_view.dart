import 'package:flutter/material.dart';
import 'package:notes_app/constants/functions.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/buttons/edit_note_button.dart';
import 'package:notes_app/widgets/edit_note_text_field.dart';
import 'package:notes_app/widgets/edit_title_text_field.dart';

class EditNoteView extends StatefulWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final GlobalKey<FormState> _editNoteKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Form(
            key: _editNoteKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Edit Note',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      EditNoteButton(
                        onPressed: () async {
                          if (_editNoteKey.currentState!.validate()) {
                            _editNoteKey.currentState!.save();
                            widget.note.dateCreatedAt =
                                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
                            widget.note.timeCreatedAt = formatTimeTo12Hour(
                              dateTime: DateTime.now(),
                            );
                            await widget.note.save();
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                EditTitleTextField(
                  note: widget.note,
                  onSaved: (value) {
                    widget.note.noteTitle = value!;
                  },
                ),
                const SizedBox(height: 20),
                EditNoteTextField(
                  note: widget.note,
                  onSaved: (value) {
                    widget.note.note = value!;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

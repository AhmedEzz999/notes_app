import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/add_note_button.dart';
import 'package:notes_app/widgets/note_text_field.dart';
import 'package:notes_app/widgets/title_text_field.dart';

class NoteBottomSheet extends StatefulWidget {
  const NoteBottomSheet({super.key});

  @override
  State<NoteBottomSheet> createState() => _NoteBottomSheetState();
}

class _NoteBottomSheetState extends State<NoteBottomSheet> {
  final GlobalKey<FormState> noteKey = GlobalKey();
  AutovalidateMode noteValidate = AutovalidateMode.disabled;
  String? title, note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Form(
        autovalidateMode: noteValidate,
        key: noteKey,
        child: Column(
          children: [
            TitleTextField(
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 30),
            NoteTextField(
              onSaved: (value) {
                note = value;
              },
            ),
            const SizedBox(height: 30),
            AddNoteButton(
              onPressed: () {
                if (noteKey.currentState!.validate()) {
                  noteKey.currentState!.save();
                } else {
                  setState(() {
                    noteValidate = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

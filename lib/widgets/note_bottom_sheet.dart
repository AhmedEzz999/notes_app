import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/add_note_button.dart';
import 'package:notes_app/widgets/note_text_field.dart';
import 'package:notes_app/widgets/title_text_field.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
      child: const Column(
        children: [
          TitleTextField(),
          SizedBox(height: 30),
          NoteTextField(),
          SizedBox(height: 50),
          AddNoteButton(),
        ],
      ),
    );
  }
}

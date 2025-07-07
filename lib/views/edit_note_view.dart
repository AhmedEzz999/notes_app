import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/edit_note_button.dart';
import 'package:notes_app/widgets/note_text_field.dart';
import 'package:notes_app/widgets/title_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Edit Note', style: TextStyle(fontSize: 30)),
                    EditNoteButton(),
                  ],
                ),
              ),
              TitleTextField(),
              SizedBox(height: 20),
              NoteTextField(),
            ],
          ),
        ),
      ),
    );
  }
}

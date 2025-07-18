import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/edit_note_cubit/edit_note_cubit.dart';
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
    return BlocProvider(
      create: (context) => EditNoteCubit(),
      child: BlocConsumer<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state is EditNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
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
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                            EditNoteButton(
                              onPressed: () =>
                                  BlocProvider.of<EditNoteCubit>(
                                    context,
                                  ).editNote(
                                    editNoteKey: _editNoteKey,
                                    note: widget.note,
                                  ),
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
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/buttons/add_note_button.dart';
import 'package:notes_app/widgets/note_text_field.dart';
import 'package:notes_app/widgets/show_snack_bar.dart';
import 'package:notes_app/widgets/title_text_field.dart';

class NoteBottomSheet extends StatefulWidget {
  const NoteBottomSheet({super.key});

  @override
  State<NoteBottomSheet> createState() => _NoteBottomSheetState();
}

class _NoteBottomSheetState extends State<NoteBottomSheet> {
  final GlobalKey<FormState> noteKey = GlobalKey();
  AutovalidateMode noteValidate = AutovalidateMode.disabled;
  late String title, note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            showSnackBar(
              context,
              message: 'Note Added Successfully',
              color: Colors.white,
            );
          }
          if (state is AddNoteFailure) {
            showSnackBar(
              context,
              message: state.errorMessage,
              color: Colors.redAccent,
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
              child: Form(
                autovalidateMode: noteValidate,
                key: noteKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 30,
                  children: [
                    TitleTextField(
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                    NoteTextField(
                      onSaved: (value) {
                        note = value!;
                      },
                    ),
                    BlocBuilder<AddNoteCubit, AddNoteState>(
                      builder: (context, state) {
                        return AddNoteButton(
                          isLoading: state is AddNoteLoading,
                          onPressed: () {
                            if (noteKey.currentState!.validate()) {
                              noteKey.currentState!.save();
                              context.read<AddNoteCubit>().addNote(
                                NoteModel(noteTitle: title, note: note, color: 5),
                              );
                            } else {
                              setState(() {
                                noteValidate = AutovalidateMode.always;
                              });
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

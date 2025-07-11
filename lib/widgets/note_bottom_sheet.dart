import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/functions.dart';
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
  late String title, noteText;

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
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 35,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
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
                          noteText = value!;
                        },
                      ),
                      BlocBuilder<AddNoteCubit, AddNoteState>(
                        builder: (context, state) {
                          return AddNoteButton(
                            isLoading: state is AddNoteLoading,
                            onPressed: () {
                              if (noteKey.currentState!.validate()) {
                                noteKey.currentState!.save();
                                final NoteModel note = NoteModel(
                                  noteTitle: title,
                                  note: noteText,
                                  dateCreatedAt:
                                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                  timeCreatedAt: formatTimeTo12Hour(
                                    dateTime: DateTime.now(),
                                  ),
                                  color: 5,
                                );
                                context.read<AddNoteCubit>().addNote(note);
                              } else {
                                setState(() {
                                  noteValidate = AutovalidateMode.always;
                                });
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
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

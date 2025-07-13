import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/functions.dart';
import 'package:notes_app/models/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());
  void editNote({
    required GlobalKey<FormState> editNoteKey,
    required NoteModel note,
  }) async {
    if (editNoteKey.currentState!.validate()) {
      editNoteKey.currentState!.save();
      note.dateCreatedAt =
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
      note.timeCreatedAt = formatTimeTo12Hour(dateTime: DateTime.now());
      await note.save();
      emit(EditNoteSuccess());
    }
  }
}

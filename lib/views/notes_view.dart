import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/buttons/show_bottom_sheet_button.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesView extends StatelessWidget {
  final List<NoteModel> notes;
  const NotesView({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
          child: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) =>
                      NoteItem(note: notes[index], noteIndex: index),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: const ShowBottomSheetButton(),
      ),
    );
  }
}

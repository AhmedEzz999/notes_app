import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/show_bottom_sheet_button.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

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
                  itemCount: 6,
                  itemBuilder: (context, index) => const NoteItem(),
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

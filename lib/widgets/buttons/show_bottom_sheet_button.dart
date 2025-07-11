import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_bottom_sheet.dart';

class ShowBottomSheetButton extends StatelessWidget {
  const ShowBottomSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      shape: const CircleBorder(),
      elevation: 0,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const NoteBottomSheet();
          },
        );
      },
      child: const Icon(Icons.add, size: 50, color: Colors.white),
    );
  }
}

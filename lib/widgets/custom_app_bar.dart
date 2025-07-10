import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/search_note_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Notes', style: TextStyle(fontSize: 32, color: Colors.white)),
          SearchNoteButton(),
        ],
      ),
    );
  }
}

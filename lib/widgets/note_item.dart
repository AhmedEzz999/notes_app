import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/buttons/delete_note_button.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Note #1',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const EditNoteView();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Go to the gym and watch movies in the cinema',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              trailing: const DeleteNoteButton(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '8:32',
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
                Text(
                  '25/05/2025',
                  style: TextStyle(fontSize: 22, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/buttons/delete_note_button.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  final int noteIndex;
  const NoteItem({super.key, required this.note, required this.noteIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26, top: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.noteTitle,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                  child: Text(
                    note.note,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              trailing: DeleteNoteButton(
                onPressed: () async {
                  await note.delete();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.timeCreatedAt,
                  style: const TextStyle(fontSize: 24, color: Colors.grey),
                ),
                Text(
                  note.dateCreatedAt,
                  style: const TextStyle(fontSize: 24, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/buttons/show_bottom_sheet_button.dart';

class NoNotesView extends StatelessWidget {
  const NoNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Icon(Icons.description, size: 180, color: Color(0xFF6E7783)),
            Text(
              'No notes yet',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Tap + to create one.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: const ShowBottomSheetButton(),
    );
  }
}

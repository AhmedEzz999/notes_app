import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class AddNoteButton extends StatelessWidget {
  final void Function()? onPressed;
  const AddNoteButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: const Text(
        'Add Note',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

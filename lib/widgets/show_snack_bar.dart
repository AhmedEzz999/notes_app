import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  required Color color,
}) {
  Navigator.pop(context);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(message, style: TextStyle(fontSize: 24, color: color)),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
    ),
  );
}

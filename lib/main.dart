import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_observer_cubit.dart';
import 'package:notes_app/views/no_notes_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleObserverCubit();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: ValueListenableBuilder(
        valueListenable: Hive.box<NoteModel>(kNotesBox).listenable(),
        builder: (context, Box<NoteModel> box, _) {
          final notes = box.values.toList();
          if (notes.isEmpty) {
            return const NoNotesView();
          } else {
            return NotesView(notes: notes);
          }
        },
      ),
    );
  }
}

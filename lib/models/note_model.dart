import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String noteTitle;
  @HiveField(1)
  final String note;
  @HiveField(2)
  final String createdAt =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  @HiveField(3)
  final int color;

  NoteModel({required this.noteTitle, required this.note, required this.color});
}

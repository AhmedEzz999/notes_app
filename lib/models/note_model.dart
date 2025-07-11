import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String noteTitle;
  @HiveField(1)
  String note;
  @HiveField(2)
  String dateCreatedAt;
  @HiveField(3)
  String timeCreatedAt;
  @HiveField(4)
  final int color;

  NoteModel({
    required this.noteTitle,
    required this.note,
    required this.dateCreatedAt,
    required this.timeCreatedAt,
    required this.color,
  });
}

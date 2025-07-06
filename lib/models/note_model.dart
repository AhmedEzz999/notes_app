class NoteModel {
  final String note;
  final DateTime createdAt = DateTime.now();

  NoteModel({required this.note});
}

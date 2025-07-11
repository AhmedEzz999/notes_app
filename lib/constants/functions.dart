String formatTimeTo12Hour({required DateTime dateTime}) {
  int hour = dateTime.hour % 12;
  hour = hour == 0 ? 12 : hour;

  String minute = dateTime.minute < 10
      ? '0${dateTime.minute}'
      : '${dateTime.minute}';
  String period = dateTime.hour >= 12 ? 'PM' : 'AM';

  return '$hour:$minute $period';
}

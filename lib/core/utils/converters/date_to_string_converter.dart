extension DateToStringConverter on DateTime {
  String get convert {
    return toString().split(' ').first;
  }
}

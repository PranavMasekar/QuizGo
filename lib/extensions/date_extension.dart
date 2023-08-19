import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toFormattedDate() {
    final format = DateFormat('dd MMM yyyy');
    return format.format(this);
  }

  String toFormattedDateMonthFirst() {
    final format = DateFormat('MMM dd yyyy');
    return format.format(this);
  }

  String toFormattedDateWithSlash() {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }

  String toFormattedDateWithoutYear() {
    final format = DateFormat('dd/MM');
    return format.format(this);
  }

  String toFormattedDateWithMonthName() {
    final formattedDate = DateFormat('MMMM y').format(this);
    final dayWithSuffix = '$day${_getDaySuffix(day)}';
    final formattedDateWithSuffix = '$dayWithSuffix $formattedDate';
    return formattedDateWithSuffix;
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

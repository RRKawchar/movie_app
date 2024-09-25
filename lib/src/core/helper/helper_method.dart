import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

kPrint(dynamic message){
  if (kDebugMode) {
    print(message);
  }
}


String formattedDate(String dateTime) {
  final DateFormat inputFormat = DateFormat('yyyy-MM-dd');
  DateTime parsedDate = inputFormat.parse(dateTime);
  final DateFormat yearFormat = DateFormat('yyyy');
  String year = yearFormat.format(parsedDate);
  return year;
}
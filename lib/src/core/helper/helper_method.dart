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


String dateTimeFormatted(String dt){
  DateTime dateTime = DateTime.parse(dt);
  String formattedDate = DateFormat('dd MMMM yyyy, hh:mm a').format(dateTime);
  return formattedDate;
}
String dateFormatted(String dt){
  DateTime dateTime = DateTime.parse(dt);
  String formattedDate = DateFormat('yyyy').format(dateTime);
  return formattedDate;
}
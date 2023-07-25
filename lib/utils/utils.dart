import 'package:intl/intl.dart';

class Utils{
  static String readTimestamp(int timestamp) {
    var format = DateFormat('dd-MM-yyyy');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var time = '';
    time = format.format(date);
    return time;
  }
}
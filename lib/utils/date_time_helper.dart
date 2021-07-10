import 'package:intl/intl.dart';

class DateTimeHelper {
  DateFormat dateFilterDisplayDateFormat() => DateFormat('dd MMM yyyy');

  ///Retrieve remaining duration from current time to End Date
  String getTimeRemaining({required DateTime endDate}) {
    Duration difference = endDate.difference(DateTime.now());
    return _durationTransform(difference);
  }

  ///Time conversion convert seconds to hours and minutes
  String _durationTransform(Duration duration) {
    List<String> parts = duration.toString().split(':');

    if (int.parse(parts[0]) >= 0) {
      return'${parts[0]}hrs ${parts[1]}min';
    } else{
      return '--';
    }
  }
}
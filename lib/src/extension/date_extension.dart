extension DateTimeExtension on DateTime {
  /// Get the month of the year string.
  /// For example if the month is 1 it will
  /// return 'Jan'. If [isLongFormat] is true
  /// it will return 'January'.
  String getMonth({bool isLongFormat = false}) {
    var currentMonth = this.month;
    if (currentMonth == 1) return (isLongFormat) ? 'January' : 'Jan';
    if (currentMonth == 2) return (isLongFormat) ? 'February' : 'Feb';
    if (currentMonth == 3) return (isLongFormat) ? 'March' : 'Mar';
    if (currentMonth == 4) return (isLongFormat) ? 'April' : 'Apr';
    if (currentMonth == 5) return (isLongFormat) ? 'May' : 'May';
    if (currentMonth == 6) return (isLongFormat) ? 'June' : 'Jun';
    if (currentMonth == 7) return (isLongFormat) ? 'July' : 'Jul';
    if (currentMonth == 8) return (isLongFormat) ? 'August' : 'Aug';
    if (currentMonth == 9) return (isLongFormat) ? 'September' : 'Sep';
    if (currentMonth == 10) return (isLongFormat) ? 'October' : 'Oct';
    if (currentMonth == 11) return (isLongFormat) ? 'November' : 'Nov';
    return (isLongFormat) ? 'December' : 'Dec';
  }

  /// Get the current day of the week or from an object,
  /// If the day is 1 then it return 'Mon'. If
  /// [isLongFormat] is true, it will return 'Monday'.
  String getDay({bool isLongFormat = false}) {
    var currentDay = this.weekday;
    if (currentDay == 1) return (isLongFormat) ? 'Monday' : 'Mon';
    if (currentDay == 2) return (isLongFormat) ? 'Tuesday' : 'Tue';
    if (currentDay == 3) return (isLongFormat) ? 'Wednesday' : 'Wed';
    if (currentDay == 4) return (isLongFormat) ? 'Thursday' : 'Thu';
    if (currentDay == 5) return (isLongFormat) ? 'Friday' : 'Fri';
    if (currentDay == 6) return (isLongFormat) ? 'Saturday' : 'Sat';
    return (isLongFormat) ? 'Sunday' : 'Sun';
  }

  /// Get the current time of day or from an object,
  /// By default it will return 24 hour clock string.
  /// For ex. '20:00' if [isTwelveHourClock] is true,
  /// it will return '8:00 PM'.
  String getTime({bool isTwelveHour = false}) {
    var hour = this.hour.toString();
    var minute = this.minute.toString();

    // Check if it is twenty hour clock.
    if (isTwelveHour) {
      String amPmString = 'AM';
      int hour12 = this.hour;
      int min12 = this.minute;
      if (this.hour >= 12) {
        amPmString = 'PM';
        hour12 = (this.hour - 12).abs();
        min12 = this.minute;
      }
      String hour12String = hour12 == 0 ? '12' : '$hour12';
      String min12String =
          min12.toString().length == 1 ? ('0$min12') : min12.toString();
      return '$hour12String:$min12String $amPmString';
    }
    // Add another zero if the time is 0 hour.
    if (hour.length == 1) hour = '0' + hour;
    if (minute.length == 1) minute = '0' + minute;
    if (hour[0] == '0' && hour[1] != '0') hour = hour.substring(1, hour.length);
    return '$hour:$minute';
  }

  /// Function to get time difference,
  /// ex. it will return "5h" if time difference 5 hours.,
  /// If [isLongFormat] is true. It will show "1 hours" instead of "1h".
  String toTimeDifference({bool isLongFormat = false}) {
    int diffByMins = DateTime.now().difference(this).inMinutes;
    final String longMin = (diffByMins == 1) ? ' minute' : ' minutes';
    final String minute = (isLongFormat) ? longMin : 'm';
    if (diffByMins < 60) return diffByMins.toString() + minute;
    // By hours
    int diffByHours = DateTime.now().difference(this).inHours;
    final String longHour = (diffByHours == 1) ? ' hour' : ' hours';
    final String hour = (isLongFormat) ? longHour : 'h';
    if (diffByHours < 24) return diffByHours.toString() + hour;
    // By days
    int diffByDays = DateTime.now().difference(this).inDays;
    final String longDay = (diffByDays == 1) ? ' day' : ' days';
    final String day = (isLongFormat) ? longDay : 'd';
    if (diffByDays < 365) return diffByDays.toString() + day;
    // By years
    double diffByYears = diffByDays / 365;
    final String longYear = (diffByYears == 1) ? ' year' : ' years';
    final String year = (isLongFormat) ? longYear : 'y';
    return diffByYears.toStringAsFixed(0) + year;
  }

  /// Convert to time string in the format of:
  /// Current day: "11:11" .
  /// Within week: "Wed 11:11".
  /// Within year: 'Jan 7 at 12:30'.
  /// If [asNumber] is true: '11/11/11 at 12:30'.
  String toDynamicTime({bool isTwelveHour = false, bool asNumber = false}) {
    DateTime date = this;
    var now = DateTime.now();
    if (now.difference(date).inDays == 0)
      return date.getTime(isTwelveHour: isTwelveHour);
    if (now.difference(date).inDays <= 7)
      return date.getDay() + ' at ' + date.getTime(isTwelveHour: isTwelveHour);
    if (now.difference(date).inDays <= 256)
      return date.toMonthDateAtTime(isTwelveHour: isTwelveHour);
    return date.toMonthDayAndYear(asNumber: asNumber) +
        ' at ${date.getTime(isTwelveHour: isTwelveHour)}';
  }

  /// Get day and time in the format where
  /// "<day> <time>" for ex. "Wed 11:11".
  String toDayAndTime({bool isTwelveHour = false}) =>
      this.getDay() + " " + this.getTime(isTwelveHour: isTwelveHour);

  /// Get the full month, date and time, for ex. 'Jan 7 at 12:30 PM'.
  String toMonthDateAtTime(
          {bool isLongFormat = false, bool isTwelveHour = true}) =>
      '${this.getMonth(isLongFormat: isLongFormat)} ${this.day} at ${this.getTime(isTwelveHour: isTwelveHour)}';

  /// Get a complete readable string of the date time
  /// in format of "<month> <day>, <year>" for ex.
  /// December 13, 1995. If [asNumber] is true, then
  /// it will return in the format of "<month>/<day>/<year>",
  /// for ex. "11/11/11".
  String toMonthDayAndYear({
    bool isMonthFullString = false,
    bool asNumber = false,
  }) {
    if (asNumber)
      return this.month.toString().padLeft(2, '0') +
          '/' +
          this.day.toString().padLeft(2, '0') +
          '/' +
          this.year.toString().substring(2, 4);
    return '${this.getMonth(isLongFormat: isMonthFullString)} ${this.day}, ${this.year}';
  }
}

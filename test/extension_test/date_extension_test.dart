import 'package:test/test.dart';
import '../../lib/src/extension/date_extension.dart';

dateExtensionTest() {
  group('Date extension test', () {
    test('getMonth(isLongFormat: true) should get the long form month string.',
        () {
      expect('January', DateTime(2020, 1, 13).getMonth(isLongFormat: true));
    });

    test(
        'getTime(isTwelveHour: true) should get correct 2:00 AM twelve hour time.',
        () {
      var test = DateTime(2020, 1, 1, 2, 0, 0).getTime(isTwelveHour: true);
      expect('2:00 AM', test);
    });

    test(
        'gettime(istwelvehour: true) should get correct 8:00 am twelve hour time.',
        () {
      var test = DateTime(2020, 1, 1, 20, 0, 0).getTime(isTwelveHour: true);
      expect('8:00 PM', test);
    });

    test(
        'gettime(istwelvehour: true) should get correct 8:00 am twelve hour time.',
        () {
      var test = DateTime(2020, 1, 1, 15, 0, 0).getTime(isTwelveHour: true);
      expect('3:00 PM', test);
    });

    test('toDynamicTime(isTwelveHour: false) should return without AM/PM', () {
      var date = DateTime.now().toDynamicTime(isTwelveHour: false);
      expect(true, RegExp("[0-9]?[0-9]:[0-9][0-9]").hasMatch(date));
    });

    test('toDynamicTime(isTwelveHour: true) should return with AM/PM', () {
      var date = DateTime.now().toDynamicTime(isTwelveHour: true);
      expect(true, RegExp("[0-9]?[0-9]:[0-9][0-9] (PM|AM)").hasMatch(date));
    });

    test('toDynamicTime() 2 days ago should return with the day.', () {
      var date = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)
          .toDynamicTime(isTwelveHour: true);
      expect(true,
          RegExp("[\\w]+ at [0-9]?[0-9]:[0-9][0-9] (PM|AM)").hasMatch(date));
    });

    test('toDynamicTime() 9 days ago should return the month.', () {
      var date = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day - 9)
          .toDynamicTime();
      expect(
          true,
          RegExp("[\\w]+ [0-9]?[0-9] at [0-9]?[0-9]:[0-9][0-9]")
              .hasMatch(date));
    });

    test('toDynamicTime() year 2011 should return the year.', () {
      var date = DateTime(2011).toDynamicTime();
      expect(
          true,
          RegExp("[\\w]+ [0-9]?[0-9], [0-9]* at [0-9]?[0-9]:[0-9][0-9]")
              .hasMatch(date));
    });

    test('toTimeDifference() with difference of more than a year', () {
      expect(
          true, RegExp('[0-9]+y').hasMatch(DateTime(2015).toTimeDifference()));

      expect(
          true,
          RegExp('[0-9] year[s]')
              .hasMatch(DateTime(2015).toTimeDifference(isLongFormat: true)));
    });
  });
}

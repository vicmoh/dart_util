import '../lib/src/util/tiny_tester.dart';
import '../lib/src/extension/string_extension.dart';
import '../lib/src/extension/number_extension.dart';
import '../lib/src/extension/date_extension.dart';
import '../lib/src/extension/list_extension.dart';

void extensionTest() {
  describe('Test if string is a list of char string.', () {
    expect('t', 'test string'[3]);
  });

  describe("toNumOnlyString() should return substring containing number.", () {
    expect('123', 'hello123 world!'.toNumOnlyString());
  });

  describe("isAlphanumeric() should accept only alphabets and numbers.", () {
    expect(true, 'testing123'.isAlphanumeric());
  });

  describe("isalphanumeric() should not accept dash.", () {
    expect(false, 'testing-123'.isAlphanumeric());
  });

  describe("isalphanumeric() should not accept spaces.", () {
    expect(false, 'testing 123'.isAlphanumeric());
  });

  describe('ellipsis() should show corresponding length.', () {
    expect('Some string...', 'Some string being tested.'.ellipsis(14));
  });

  describe('toSentenceCase() should only capitalize the first char.', () {
    expect('Hello world!', 'hello world!'.toSentenceCase());
  });

  describe(
      'toSentenceCase(withPeriod: true) should add period if it doesn\'t exist.',
      () {
    expect('Hello world.', 'hello world'.toSentenceCase(withPeriod: true));
  });

  describe(
      'toSentenceCase(withPeriod: true) should not add period if it exist.',
      () {
    expect('Hello world.', 'hello world.'.toSentenceCase(withPeriod: true));
  });

  describe('toTitleCase() should upper case words that is necessary.', () {
    expect('The Hello World and the Money in the Bucket',
        'The hello world and the money in the bucket'.toTitleCase());
  });

  describe('toShortForm() should convert 1000 to 1k.', () {
    expect('1k', 1000.toShortForm());
  });

  describe('toShortForm() should convert 999.9 to 999.9.', () {
    expect('999.9', 999.9.toShortForm());
  });

  describe('toShortForm() should convert 999999 to 999.9k.', () {
    expect('999.9k', 999999.toShortForm());
  });

  describe('toShortForm() should convert 999500 to 999.5k.', () {
    expect('999.5k', 999500.toShortForm());
  });

  describe('toShortForm() should convert 1500000 to 1.5m.', () {
    expect('1.5m', 1500000.toShortForm());
  });

  describe('isValidEmailFormat() i@i.i should be valid.', () {
    expect(true, 'i@i.i'.isValidEmailFormat());
  });

  describe('isValidEmailFormat() missing @ should not be accepted.', () {
    expect(false, 'teddy_bear_master_hotmail.com'.isValidEmailFormat());
  });

  describe('isValidEmailFormat() should allow dash in first section.', () {
    expect(true, 'teddy-bear-master@hotmail.i'.isValidEmailFormat());
  });

  describe('getMonth() should get the short form month string.', () {
    expect('Jan', DateTime(2020, 1, 13).getMonth());
  });

  describe(
      'getMonth(isLongFormat: true) should get the long form month string.',
      () {
    expect('January', DateTime(2020, 1, 13).getMonth(isLongFormat: true));
  });

  describe(
      'getTime(isTwelveHour: true) should get correct 2:00 AM twelve hour time.',
      () {
    var test = DateTime(2020, 1, 1, 2, 0, 0).getTime(isTwelveHour: true);
    expect('2:00 AM', test);
  });

  describe(
      'gettime(istwelvehour: true) should get correct 8:00 am twelve hour time.',
      () {
    var test = DateTime(2020, 1, 1, 20, 0, 0).getTime(isTwelveHour: true);
    expect('8:00 PM', test);
  });

  describe(
      'gettime(istwelvehour: true) should get correct 8:00 am twelve hour time.',
      () {
    var test = DateTime(2020, 1, 1, 15, 0, 0).getTime(isTwelveHour: true);
    expect('3:00 PM', test);
  });

  describe('sortBy() list should be able to sort.', () {
    expect(
      ['a', 'b', 'c', 'y', 'z'].toString(),
      ['b', 'c', 'y', 'z', 'a'].sortBy((a, b) => a.compareTo(b)).toString(),
    );
  });

  describe('list.has() should return true if at least one condition is true.',
      () {
    expect(
        true,
        ["yo , yp", "asdfa", "bruh", "fajksdhbf", "asdflkasdfl"]
            .has((el) => el == 'bruh'));
  });

  describe('list.has() should return false if condition is never true.', () {
    expect(
        false,
        ["yo , yp", "asdfa", "aasdf", 'asdjfnalksdf', 'asd']
            .has((el) => el == 'bruh'));
  });

  describe('toDynamicTime(isTwelveHour: false) should return without AM/PM',
      () {
    var date = DateTime.now().toDynamicTime(isTwelveHour: false);
    expect(true, RegExp("[0-9]?[0-9]:[0-9][0-9]").hasMatch(date));
  });

  describe('toDynamicTime(isTwelveHour: true) should return with AM/PM', () {
    var date = DateTime.now().toDynamicTime(isTwelveHour: true);
    expect(true, RegExp("[0-9]?[0-9]:[0-9][0-9] (PM|AM)").hasMatch(date));
  });

  describe('toDynamicTime() 2 days ago should return with the day.', () {
    var date = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)
        .toDynamicTime(isTwelveHour: true);
    expect(true,
        RegExp("[\\w]+ at [0-9]?[0-9]:[0-9][0-9] (PM|AM)").hasMatch(date));
  });

  describe('toDynamicTime() 9 days ago should return the month.', () {
    var date = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 9)
        .toDynamicTime();
    expect(true,
        RegExp("[\\w]+ [0-9]?[0-9] at [0-9]?[0-9]:[0-9][0-9]").hasMatch(date));
  });

  describe('toDynamicTime() year 2011 should return the year.', () {
    var date = DateTime(2011).toDynamicTime();
    expect(
        true,
        RegExp("[\\w]+ [0-9]?[0-9], [0-9]* at [0-9]?[0-9]:[0-9][0-9]")
            .hasMatch(date));
  });
}

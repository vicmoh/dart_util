import 'package:test/test.dart';
import '../../lib/src/extension/list_extension.dart';

listExtensionTest() {
  group('List extension test.', () {
    test('sortBy() list should be able to sort.', () {
      expect(
        ['a', 'b', 'c', 'y', 'z'].toString(),
        ['b', 'c', 'y', 'z', 'a'].sortBy((a, b) => a.compareTo(b)).toString(),
      );
    });

    test('list.has() should return true if at least one condition is true.',
        () {
      expect(
          true,
          ["yo , yp", "asdfa", "bruh", "fajksdhbf", "asdflkasdfl"]
              .has((el) => el == 'bruh'));
    });

    test('list.has() should return false if condition is never true.', () {
      expect(
          false,
          ["yo , yp", "asdfa", "aasdf", 'asdjfnalksdf', 'asd']
              .has((el) => el == 'bruh'));
    });

    test('forEachToList() should return correct list.', () {
      var list = [1, 2, 3];
      expect(true, '[2, 3, 4]' == list.forEachToList((e) => e + 1).toString());
    });
  });
}

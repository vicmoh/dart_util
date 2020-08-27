import 'package:test/test.dart';
import '../../lib/src/extension/number_extension.dart';

numberExtensionTest() {
  group('Number extension test', () {
    test('toShortForm() should convert 1000 to 1k.', () {
      expect('1k', 1000.toShortForm());
    });

    test('toShortForm() should convert 999.9 to 999.9.', () {
      expect('999.9', 999.9.toShortForm());
    });

    test('toShortForm() should convert 999999 to 999.9k.', () {
      expect('999.9k', 999999.toShortForm());
    });

    test('toShortForm() should convert 999500 to 999.5k.', () {
      expect('999.5k', 999500.toShortForm());
    });

    test('toShortForm() should convert 1500000 to 1.5m.', () {
      expect('1.5m', 1500000.toShortForm());
    });
  });
}

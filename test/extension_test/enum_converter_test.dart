

import '../../lib/src/util/enum_converter.dart';
import 'package:test/test.dart';

enum Test { one, two, three, one_two, oneTwo }

enumConverterTest() {
  group('Enum converter test.', () {
    test('EnumConverter.asString(): should convert the expected string.', () {
      var res = EnumConverter.asString(Test.one_two);
      expect(res, 'one_two');

      res = EnumConverter.asString(Test.oneTwo);
      expect(res, 'oneTwo');
    });

    test(
        'EnumConverter.asCamelCaseString(): should convert the expected string.',
        () {
      var res = EnumConverter.asCamelCaseString(Test.one_two);
      expect(res, 'One two');

      res = EnumConverter.asCamelCaseString(Test.oneTwo);
      expect(res, 'One two');
    });

    test('EnumConverter.asEnum(): should convert the expected enum.', () {
      var res = EnumConverter.asEnum(Test.values, 'one_two');
      expect(Test.one_two, res);

      res = EnumConverter.asEnum(Test.values, 'oneTwo');
      expect(Test.oneTwo, res);
    });
  });
}

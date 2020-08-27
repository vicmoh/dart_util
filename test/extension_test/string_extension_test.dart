import 'package:test/test.dart';
import '../../lib/src/extension/string_extension.dart';

stringExtensionTest() {
  group('String extension test', () {
    test('Test if string is a list of char string.', () {
      expect('t', 'test string'[3]);
    });

    test("toNumOnlyString() should return substring containing number.", () {
      expect('123', 'hello123 world!'.toNumOnlyString());
    });

    test("isAlphanumeric() should accept only alphabets and numbers.", () {
      expect(true, 'testing123'.isAlphanumeric());
    });

    test("isalphanumeric() should not accept dash.", () {
      expect(false, 'testing-123'.isAlphanumeric());
    });

    test("isalphanumeric() should not accept spaces.", () {
      expect(false, 'testing 123'.isAlphanumeric());
    });

    test('ellipsis() should show corresponding length.', () {
      expect('Some string...', 'Some string being tested.'.ellipsis(14));
    });

    test('toSentenceCase() should only capitalize the first char.', () {
      expect('Hello world!', 'hello world!'.toSentenceCase());
    });

    test(
        'toSentenceCase(withPeriod: true) should add period if it doesn\'t exist.',
        () {
      expect('Hello world.', 'hello world'.toSentenceCase(withPeriod: true));
    });

    test('toSentenceCase(withPeriod: true) should not add period if it exist.',
        () {
      expect('Hello world.', 'hello world.'.toSentenceCase(withPeriod: true));
    });

    test('toTitleCase() should upper case words that is necessary.', () {
      expect('The Hello World and the Money in the Bucket',
          'The hello world and the money in the bucket'.toTitleCase());
    });

    test('Remove duplicate new lines should not cause inline.', () {
      expect('Hello\n\nworld!',
          'Hello\n\n\n\n\n\nworld!'.removeDuplicateWhiteSpaces());

      expect('Hello\n\nworld!',
          'Hello\n \n world!'.removeDuplicateWhiteSpaces());

      expect('Hello\n\nworld!',
          'Hello\n\n \n world!'.removeDuplicateWhiteSpaces());
    });
  });
}

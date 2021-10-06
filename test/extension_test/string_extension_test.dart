

import 'package:test/test.dart';
import '../../lib/src/extension/string_extension.dart';

stringExtensionTest() {
  group('String extension test.', () {
    test('Test if string is a list of char string.', () {
      expect('test string'[3], 't');
    });

    test("toNumOnlyString() should return substring containing number.", () {
      expect('hello123 world!'.toNumOnlyString(), '123');
    });

    test("isAlphanumeric() should accept only alphabets and numbers.", () {
      expect('testing123'.isAlphanumeric(), true);
    });

    test("isalphanumeric() should not accept dash.", () {
      expect('testing-123'.isAlphanumeric(), false);
    });

    test("isalphanumeric() should not accept spaces.", () {
      expect('testing 123'.isAlphanumeric(), false);
    });

    test('ellipsis() should show corresponding length.', () {
      expect('Some string being tested.'.ellipsis(14), 'Some string...');
    });

    test('toSentenceCase() should only capitalize the first char.', () {
      expect('hello world!'.toSentenceCase(), 'Hello world!');
    });

    test(
        'toSentenceCase(withPeriod: true) should add period if it doesn\'t exist.',
        () {
      expect('hello world'.toSentenceCase(withPeriod: true), 'Hello world.');
    });

    test('toSentenceCase(withPeriod: true) should not add period if it exist.',
        () {
      expect('hello world.'.toSentenceCase(withPeriod: true), 'Hello world.');
    });

    test('toTitleCase() should upper case words that is necessary.', () {
      expect('the hello world and the money in the bucket'.toTitleCase(),
          'The Hello World and the Money in the Bucket');

      expect(
          'the hello world and the money in the bucket'
              .toTitleCase(capAllWords: true),
          'The Hello World And The Money In The Bucket');
    });

    test('Remove duplicate new lines should not cause inline.', () {
      expect('Hello\n\n\n\n\n\nworld!'.removeDuplicateWhiteSpaces(),
          'Hello\n\nworld!');

      expect(
          'Hello\n \n world!'.removeDuplicateWhiteSpaces(), 'Hello\n\nworld!');

      expect('Hello\n\n \n world!'.removeDuplicateWhiteSpaces(),
          'Hello\n\nworld!');

      expect('Hello\nworld!'.removeDuplicateWhiteSpaces(), 'Hello\nworld!');
    });

    test("Title case should capitalize the first letter.", () {
      expect("hello  world".toTitleCase(), "Hello World");

      expect("this is my money".toTitleCase(), "This Is My Money");

      expect("my money".toTitleCase(), "My Money");
    });
  });
}

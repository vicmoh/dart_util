extension StringExtension on String {
  /// Convert string to phone number format such as string
  /// to "+1 519 123 4567". By  default it will remove
  /// all alphabets and other character except for integers.
  String toPhoneFormat({
    bool withDash = false,
    bool noSpaces = false,
  }) {
    const maxPhoneLength = 15;
    String temp = this
        .trim()
        .removeDuplicateWhiteSpaces()
        .replaceAll(RegExp('[^0-9]'), '');
    String phoneFormat = '';
    String replacingFormat = ' ';
    if (withDash) replacingFormat = '-';
    if (noSpaces) replacingFormat = '';
    if (temp.length > maxPhoneLength)
      temp = temp.substring(temp.length - 15, temp.length);
    for (int x = 0; x < temp.length; x++) {
      if (x == 0) phoneFormat += '+';
      if (x == temp.length - 4 || x == temp.length - 7 || x == temp.length - 10)
        phoneFormat += replacingFormat;
      phoneFormat += temp[x];
    }
    return phoneFormat.trim();
  }

  /// Remove alphabets to become a digit only value string.
  /// Turn into number string, punctuation and white spaces
  /// will be removed. The only accepting value is numbers and periods.
  ///
  /// Example: 192.168.0.0
  String toNumOnlyString() {
    var temp = this.replaceAll(RegExp('[^0-9.]'), '');
    return temp;
  }

  /// Function to to determine if string is alphanumeric.
  /// If the string only contains numbers and alphabets
  /// then it will return [true].
  /// Otherwise if it contains white spaces or punctuation
  /// and other symbol it will return [false].
  bool isAlphanumeric() {
    assert(this != null);
    return this.contains(RegExp(r'[^A-Za-z0-9]')) ? false : true;
  }

  /// Function remove any duplicate white spaces.
  /// If the entity; spaces, tabs, or new lines are adjacent
  /// to each other, it is defined as duplicate.
  /// Remove duplicate spaces to single space.
  /// Remove duplicate tabs to single tabs.
  /// Remove duplicate new lines to single new lines.
  String removeDuplicateWhiteSpaces() {
    if (this == null) return this;
    String toReturn = this.trim();
    toReturn = toReturn.replaceAll(RegExp(r'\t+'), ' ');
    toReturn = toReturn.replaceAll(RegExp(r'[ ]+'), ' ');
    toReturn = toReturn.replaceAll(RegExp(r'\n[\t ]*'), '\n');
    toReturn = toReturn.replaceAll(RegExp(r'\n\n[\n\t ]*'), '\n\n');
    toReturn = toReturn.replaceAll(RegExp('\n[ ]+'), '\n');
    return toReturn;
  }

  /// Turn the string input a list of words
  /// that are used for indexing.
  List<String> toIndexableList() {
    if (this == null) return [];
    return Set.of(this
        .split(RegExp(r'[^A-Za-z0-9]'))
        .map((el) => el.toLowerCase())
        .where((el) => el != '')).toList();
  }

  /// This function cut the string and add
  /// ellipsis. Set string with ellipsis [maxLength]
  /// of the string.
  /// Output example 14 as [maxLength]: Some string...
  String ellipsis(int maxLength) {
    if (this == null) return this;
    String temp = this;
    if (temp.length >= maxLength)
      temp = temp.substring(0, maxLength - 3) + '...';
    return temp;
  }

  /// Convert string first letter to uppercase case, for example
  /// value is 'hello' it returns 'Hello'.
  /// This will remove any duplicate white space.
  /// Add period at the end if [withPeriod] is true.
  String toSentenceCase({bool withPeriod = false}) {
    if (this == null) return this;
    var temp = this;
    String firstChar = temp.substring(0, 1).toUpperCase();
    String sen = (firstChar + temp.substring(1, temp.length))
        .trim()
        .removeDuplicateWhiteSpaces();
    var toks = sen.split(RegExp('[ ]'));
    if (withPeriod == true && !toks.last.contains(RegExp('[!.:?]'))) sen += '.';
    return sen;
  }

  /// Lower case the first character in string.
  String toFirstCharLower() {
    if (this == null) return this;
    var temp = this;
    String firstChar = temp.substring(0, 1).toLowerCase();
    String res = (firstChar + temp.substring(1, temp.length))
        .trim()
        .removeDuplicateWhiteSpaces();
    return res;
  }

  /// Reference1: https://capitalizemytitle.com/.
  /// Reference2: https://www.bkacontent.com/how-to-correctly-use-apa-style-title-case/
  /// Reference3: https://titlecase.com/
  /// Capitalize the first and the last word.
  /// Capitalize nouns, pronouns, adjectives, verbs, adverbs, and subordinate conjunctions.
  /// Lowercase articles (a, an, the), coordinating conjunctions, and prepositions.
  /// Lowercase the ‘to’ in an infinitive (I want to play guitar).
  /// If [capAllWords] is true, all words first character will be capitalize.
  String toTitleCase({Set<String> uncounted, capAllWords: false}) {
    if (this == null) return this;
    Set<String> _prepositions = {
      'a',
      'for',
      'so',
      'an',
      'in',
      'the',
      'and',
      'nor',
      'to',
      'at',
      'of',
      'up',
      'but',
      'on',
      'yet',
      'by',
      'or',
    }..addAll(uncounted ?? {});
    var words = this.removeDuplicateWhiteSpaces().split(' ');
    var res = '';
    for (int x = 0; x < words.length; x++) {
      if (x != 0 &&
          !capAllWords &&
          (_prepositions.contains(words[x]) /*|| words[x].length < 4*/))
        res += (x == 0 ? '' : ' ') + words[x].toLowerCase();
      else
        res += (x == 0 ? '' : ' ') + words[x].toSentenceCase();
    }

    return res
        .toSentenceCase()
        .replaceAll(RegExp('[.]+'), '')
        .removeDuplicateWhiteSpaces();
  }

  /// Check if the string is valid email format.
  bool isValidEmailFormat() {
    bool emailValid = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
    return emailValid;
  }
}

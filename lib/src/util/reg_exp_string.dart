class RegExpStrings {
  /// Regex format for http url.
  /// Http must be at the start.
  static const HTTP_REGEX =
      r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)";

  /// Url regex format, this does not
  /// need the https string at the start.
  static const URL_REGEX =
      r"[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)";

  /// Hash tag format.
  static const HASH_TAG_REGEX = r"(?:\s|^)#[A-Za-z0-9\-\.\_]+(?:\s|$)";
}

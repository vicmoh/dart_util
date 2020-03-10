/// A class for deciding certain
/// condition in list and maps.
class Decide {
  /// Returns the object from that condition.
  static T from<T>(T Function() condition) => condition();
}

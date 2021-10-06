import './tiny_tester.dart';
import '../extension/string_extension.dart';

class Log {
  static int _numOfDisableFuncCalled = 0;
  static bool trackLogs = true;
  final String tag;
  final String message;
  final DateTime timestamp;

  /// Disable the log.
  /// [Must be called once].
  static void disable() {
    _numOfDisableFuncCalled++;
    assert(_numOfDisableFuncCalled == 1 || _numOfDisableFuncCalled == 0);
    trackLogs = false;
  }

  /// Trim any white spaces and remove any symbols.
  static String _trim(String val) {
    return val
        .trim()
        .removeDuplicateWhiteSpaces()
        .replaceAll(RegExp('[^a-zA-Z0-9.]+'), '');
  }

  /// Similar to the Log() function, however,
  /// this does does not print to the console
  /// and does not track the logs.
  /// It will only return the string.
  static String asString(object, message) {
    String messageTemp = '$message'.trim();
    String tag =
        object is String ? _trim(object) : _trim(object.runtimeType.toString());
    return tag + '(): ' + messageTemp;
  }

  /// Print function replacement. This function will
  /// track the log and create a timestamp history.
  /// When calling this log in a class pass the [object]
  /// with [this]. It will print associated with
  /// the object name.
  ///
  /// For example:
  /// ```
  /// Log(this, 'Hello World!');
  /// ```
  Log(object, message)
      : timestamp = DateTime.now(),
        this.message = '$message'.trim(),
        this.tag = object is String
            ? _trim(object)
            : _trim(object.runtimeType.toString()) {
    // Keep track error if needed.
    if (trackLogs) {
      if (_stackLogs.length < 256 * 2) {
        _stackLogs.add(this);
        print(this.toString());
      } else {
        _stackLogs.removeLast();
        _stackLogs.add(this);
      }
      _stackLogs
          .sort((a, b) => a.timestamp.compareTo(b.timestamp) >= 1 ? -1 : 1);
    }
  }

  /// The list of errors collected in the past.
  static List<Log> _stackLogs = [];
  static List<Log> get list => List<Log>.of(_stackLogs).toList();

  /// To json object.
  Map<String, dynamic> toJson() => {
        'message': this.message,
        'tag': this.tag,
        'timestamp': this.timestamp.toIso8601String(),
      };

  @override
  String toString() => this.tag + '(): ' + this.message;

  /// Function for testing this class.
  static void runTest() {
    const debug = "Log(): ";
    Log.disable();

    describe('Log() should remove ":", "()" and duplicate white spaces.', () {
      expect('Log(): Hello World!',
          Log(debug, '\t \n Hello World! \n \t').toString());
    });

    describe('Log.asString() should remove ":", "()" and white spaces.', () {
      expect('Log(): Hello World!',
          Log.asString(debug, '\t \n Hello World! \n \t'));
    });

    describe("Log() should remove period.", () {
      expect('test.this(): test', Log.asString('test.this(): ', 'test'));
    });

    describe("Log() should convert to string when object is passed.", () {
      var res;
      try {
        throw Exception('Some error');
      } catch (err) {
        res = Log.asString(debug, err);
      }
      expect('Log(): Exception: Some error', res);
    });
  }
}

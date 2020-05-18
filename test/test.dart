import '../lib/src/util/log.dart';
import '../lib/src/util/tiny_tester.dart';

import 'extension_test.dart';

void main(List<String> args) {
  extensionTest();
  Log.runTest();
  testResult();
}

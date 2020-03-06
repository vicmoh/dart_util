import '../lib/src/util/log.dart';
import '../lib/src/util/test.dart';

import 'extension_test.dart';

void main(List<String> args) {
  extensionTest();
  Log.runTest();
  Test.showFinalResult();
}

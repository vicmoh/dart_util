import '../lib/src/util/log.dart';
import '../lib/src/util/tiny_tester.dart';
import '../lib/src/util/result.dart';

import 'extension_test.dart';

void main(List<String> args) {
  extensionTest();
  Log.runTest();
  testResult();
  Result.suppress();
  Result.hasError(value: 'Testing',
		clientMessage: 'bruh',
		devMessage: 'yoo',
		errorType: ErrorTypes.other);
}

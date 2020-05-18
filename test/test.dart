import '../lib/src/util/log.dart';
import '../lib/src/util/test.dart';
import '../lib/src/util/tiny_tester.dart';

import 'extension_test.dart';

void main(List<String> args) {
  extensionTest();
  Log.runTest();
  Test.showFinalResult();
  describe("Testing passing", (){
	expect(true, true);
  });

  describe("Testing failure", (){
	expect(true, false);
  });

  testResult();
}

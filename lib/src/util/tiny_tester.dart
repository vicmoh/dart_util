import 'dart:io';
import './ansi_pen.dart';

int _totalPass = 0;
int _caseNum = 0;
List _failedCases = [];
final _yellow = AnsiPen()..yellow();
final _red = AnsiPen()..red();
final _green = AnsiPen()..green();
final _cyan = AnsiPen()..cyan();

void describe(String desc, Function() test) {
  assert(desc != null);
  assert(test != null);
  stdout.write(
      '${_cyan('#' + (++_caseNum).toString() + ":")} ${_yellow(desc + " -> ")}');
  test();
}

void expect(expect, value) {
  bool isPass = expect == value;
  if (isPass) {
    _totalPass++;
    print(_green('PASS'));
  } else {
    print(_red('FAILED'));
    _failedCases.add("#$_caseNum");
  }

  if (!isPass) {
    print(_red('\tValue    -> $value'));
    print(_red('\tExpected -> $expect'));
  }
}

void testResult() {
  var percentage = (_totalPass / _caseNum) * 100;
  if (percentage != 100) print(_cyan('\nFailed cases: $_failedCases'));
  print(_yellow('Test passing: ') +
      (percentage == 100
          ? _green(percentage.toStringAsFixed(2) + '%\n')
          : _red(percentage.toStringAsFixed(2) + '%\n')));
}

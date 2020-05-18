import 'dart:io';
import './ansi_pen.dart';

int _totalPass = 0;
int _caseNum = 0;
bool _isSuppress = false;
List _failedCases = [];
final _yellow = AnsiPen()..yellow();
final _red = AnsiPen()..red();
final _green = AnsiPen()..green();
final _cyan = AnsiPen()..cyan();

void startTesting({bool isSuppress = false}) {
  _isSuppress = isSuppress;
}

void describe(String desc, Function() test) {
  assert(desc != null);
  assert(test != null);
  if (!_isSuppress)
    stdout.write(
        '${_cyan('#' + (++_caseNum).toString() + ":")} ${_yellow(desc + " -> ")}');
  else
    _caseNum++;
  test();
}

void expect(expect, value) {
  bool isPass = expect == value;
  if (isPass) {
    _totalPass++;
    if (!_isSuppress) print(_green('PASS'));
  } else {
    if (!_isSuppress) print(_red('FAILED'));
    _failedCases.add("#$_caseNum");
  }

  if (!_isSuppress) if (!isPass) {
    print(_red('\tValue    -> $value'));
    print(_red('\tExpected -> $expect'));
  }
}

void testResult() {
  var percentage = (_totalPass / _caseNum) * 100;
  var fails = '\n';
  if (percentage != 100)
    fails += _yellow('Failed cases: ') + _cyan('$_failedCases\n');
  print(fails +
      _yellow('Test passing: ') +
      (percentage == 100
          ? _green(percentage.toStringAsFixed(2) + '%\n')
          : _red(percentage.toStringAsFixed(2) + '%\n')));
}

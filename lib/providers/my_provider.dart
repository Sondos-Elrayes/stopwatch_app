import 'dart:async';

import 'package:flutter/cupertino.dart';

class MyProvider with ChangeNotifier {
  bool _startIsPressed = false;
  bool _resetIsPressed = false;
  String _timer = '00:00:00.00';
  var _stopWatch = Stopwatch();

  bool get startIsPressed => _startIsPressed;
  bool get resetIsPressed => _resetIsPressed;
  String get timer => _timer;

  void _startTimer() {
    Timer(Duration(milliseconds: 10), keepRunning);
  }

  void keepRunning() {
    if (_stopWatch.isRunning) {
      _startTimer();
    }
    _timer = _stopWatch.elapsed.inHours.toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
        '.' +
        ((_stopWatch.elapsed.inMilliseconds % 1000) ~/ 10)
            .toString()
            .padLeft(2, '0');
    notifyListeners();
  }

  void start() {
    _startIsPressed = !_startIsPressed;
    _stopWatch.start();
    _startTimer();
    notifyListeners();
  }

  void stop() {
    _startIsPressed = !_startIsPressed;
    _stopWatch.stop();
    notifyListeners();
  }

  void reset() {
    _resetIsPressed = !_resetIsPressed;
    _stopWatch.reset();
    _timer = '00:00:00.00';
    stop();
    _startIsPressed = false;
    notifyListeners();
  }
}

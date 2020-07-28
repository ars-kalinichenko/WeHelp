import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  /// Adds the time between the change in demand from the user and the sending of this request to the server.
  /// Necessary, as without this, requests will be sent more often.

  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

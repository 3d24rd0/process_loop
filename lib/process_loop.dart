library process_loop;

import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';

/// A ProgressLoop.
class ProgressLoop {
  final String _executable;
  final List<String> _arguments;
  final Duration _loop;

  StreamController<String> _controller = StreamController<String>();
  bool _stop = false;

  /// Returns [Stream] of stdout.
  Stream<String> get stdout => _controller.stream;

  ProgressLoop({
    @required executable,
    @required arguments,
    @required loop,
  })  : assert(executable != null),
        _executable = executable,
        _arguments = arguments ?? List<String>.empty(),
        _loop = loop ?? Duration(seconds: 1);

  /// Run process.
  start() {
    _stop = false;
    var process = Process.start(_executable, _arguments).then(
      (process) {
        process.stdout.listen((event) {
          _controller.add(SystemEncoding().decode(event).trim());
          if (_stop) {
            process.kill();
          }
        });
      },
    );
    process.whenComplete(() => Future.delayed(_loop, () {
          start();
        }));
  }

  /// Stop process.
  stop() {
    _stop = true;
  }
}

import 'package:flutter_test/flutter_test.dart';

import 'package:process_loop/process_loop.dart';

void main() {
  test('test return of process', () async {
    final processLoop = ProgressLoop(
      executable: "echo",
      arguments: List.of(["hello"]),
      loop: null,
    );
    processLoop.start();
    final hello = await processLoop.stdout.last;
    processLoop.stop();

    expect(hello, "hello");
  });
}

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_part2/task.dart';

void main() {
  test('testing toggle function', () {
    //initilize task
    final task = Task(title: 'running 10 km');

    //test initial state of object
    expect(task.isCompleted, false);

    // change state
    task.toggleCompletion();

    //test new state
    expect(task.isCompleted, true);

  });
}
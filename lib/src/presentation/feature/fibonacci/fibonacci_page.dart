import 'package:flutter/material.dart';

import 'widget/fibonacci_button.dart';
import 'widget/fibonacci_display.dart';

/// Page with a centralized display for the current [FibonacciNumber] and a
/// bottom row of buttons to change to the previous or next number in the Fibonacci Sequence.
class FibonacciPage extends StatelessWidget {
  /// Constructor.
  const FibonacciPage({super.key});

  /// Builds a centralized display for the current [FibonacciNumber] and a
  /// bottom row of buttons to change to the previous or next number in the Fibonacci Sequence.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fibonacci Sequence')),
      body: Padding(
        padding: const EdgeInsets.only(left: 48.0, right: 48.0, bottom: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FibonacciDisplay(),
            const SizedBox(height: 24),
            _buttonsRow(),
          ],
        ),
      ),
    );
  }

  /// Row of buttons to set current the next of previous number in the Fibonacci sequence.
  Widget _buttonsRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          FibonacciButton(previous: true),
          SizedBox(width: 56),
          FibonacciButton(),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/usecase/fibonacci_use_case.dart';

/// Display the current [FibonacciNumber] in a container.
///
/// This consumer widget observes the [fibonacciStateProvider] to rebuild the display.
///
/// Inside the container the text is inside a FittedBox to deal with large numbers that would otherwize wrap the
/// number display.
class FibonacciDisplay extends ConsumerWidget {
  /// Constructor.
  const FibonacciDisplay({super.key});

  /// Display the current [FibonacciNumber] in a container.
  ///
  /// This consumer widget observes the [fibonacciStateProvider] to rebuild the display.
  ///
  /// Inside the container the text is inside a FittedBox to deal with large numbers that would otherwize wrap the
  /// number display.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final fibonacci = ref.watch(fibonacciStateProvider);

    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        border: Border.all(color: colors.primary, width: 3.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FittedBox(
        child: Text(
          fibonacci.value.toString(),
          style: textTheme.displayMedium,
        ),
      ),
    );
  }
}

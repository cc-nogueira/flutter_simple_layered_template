import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/exception/fibonacci_limit_exception.dart';
import '../../../../domain/usecase/fibonacci_use_case.dart';

/// Next or Prev Fibonacci Button.
///
/// Define a button to call the [FibonacciUseCase] to either set the next or previous fibonacci number.
/// The button resembles a FAB (FloatingActionButton).
///
/// Shows a SnackBar warning if the invocation of the use case throws a [FibonacciLimitException].
class FibonacciButton extends ConsumerWidget {
  /// Constructor.
  const FibonacciButton({super.key, this.previous = false});

  /// Defines the type of the button.
  final bool previous;

  /// Builds a button to call the [FibonacciUseCase] to either set the next or previous fibonacci number.
  ///
  /// The button resembles a FAB (FloatingActionButton).
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: colors.primaryContainer,
      ),
      child: IconButton(
        color: colors.onPrimaryContainer,
        onPressed: () => _onPressed(context, ref),
        icon: previous ? const Icon(Icons.remove) : const Icon(Icons.add),
      ),
    );
  }

  /// On button pressed handle will invoke the appropriate method in [FibonacciUseCase].
  ///
  /// The invocation is wrapped in try catch to show the [_alertLimitReached] message if the
  /// user tries to pass beyond the first Fibonacci (0) and the last supported value (would go beyond MaxInt).
  void _onPressed(BuildContext context, WidgetRef ref) {
    final useCase = ref.read(fibonacciUseCaseProvider);
    try {
      if (previous) {
        useCase.prev();
      } else {
        useCase.next();
      }
    } on FibonacciLimitException catch (e) {
      _alertLimitReached(context, e.type);
    }
  }

  /// Shows a SnackBar notifying that the user has reached the lower or upper limit of Fibonacci numbers.
  void _alertLimitReached(BuildContext context, FibonacciLimitType type) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final message = 'Reached ${type.name} Fibonacci limit.';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colors.surfaceVariant,
        content: Text(message, style: textTheme.titleLarge?.copyWith(color: colors.onSurfaceVariant)),
      ),
    );
  }
}

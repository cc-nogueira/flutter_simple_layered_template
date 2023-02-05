import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entity/fibonacci_number.dart';
import '../exception/fibonacci_limit_exception.dart';

part 'state/fibonacci_state.dart';
part 'fibonacci_use_case.g.dart';

/// [FibonacciUseCase] provider.
@riverpod
FibonacciUseCase fibonacciUseCase(FibonacciUseCaseRef ref) => FibonacciUseCase(ref);

/// Business rules for Fibonacci Use Case.
///
/// The current [FibonacciNumber] is stored in the [fibonacciStateProvider], part of this file.
/// User may directly observe this provider, but all modifications are handled by this [FibonacciUseCase].
///
/// Contains methods to set current the next or previous number in the Fibonacci sequence.
/// These methods throw [FibonacciLimitException] if the user tries to go before the first Fibonacci number (0),
/// or past the greatest Fibonacci number supported by the platform int representation.
class FibonacciUseCase {
  /// Const constructor.
  const FibonacciUseCase(this.ref);

  /// Riverpod ref.
  final Ref ref;

  /// Set current the next value in the Fibonacci sequence.
  ///
  /// Throws [FibonacciLimitException.upperLimit] if the user tries to go past the
  /// greatest Fibonacci number supported by the platform int representation.
  void next() {
    final current = ref.read(fibonacciStateProvider);
    if (!current.hasNext) {
      throw FibonacciLimitException.upperLimit;
    }
    ref.read(fibonacciStateProvider.notifier).state = current.next;
  }

  /// Set current the previous value in the Fibonacci sequence.
  ///
  /// Throws [FibonacciLimitException.upperLimit] if the user tries to go past the
  /// greatest Fibonacci number supported by the platform int representation.
  void prev() {
    final current = ref.read(fibonacciStateProvider);
    if (!current.hasPrevious) {
      throw FibonacciLimitException.lowerLimit;
    }
    ref.read(fibonacciStateProvider.notifier).state = current.previous;
  }
}

part of '../fibonacci_use_case.dart';

/// Fibonacci [StateNotifier] and [fibonacciStateProvider].
///
/// Stores current [FibonacciNumber] in a Riverpod [StateNotifier].
/// User may directly observe the provider, but all modifications are handled only by the [FibonacciUseCase].
@Riverpod(keepAlive: true)
class FibonacciState extends _$FibonacciState {
  /// Starts with the first value in the Fibonacci sequence, [FibonacciNumber.zero].
  @override
  FibonacciNumber build() {
    return FibonacciNumber.zero;
  }

  /// Transform the state setter in [protected] to make modification private to [FibonacciUseCase].
  @override
  @protected
  set state(FibonacciNumber value) => super.state = value;
}

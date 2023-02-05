import 'package:freezed_annotation/freezed_annotation.dart';

part 'fibonacci_number.freezed.dart';

/// FibonacciNumber entity.
///
/// Holds a fibonacci value and the previous value in the sequence.
///
/// Offer methods to generate the next and previous numbers in the Fibonacci sequence.
///
/// Allows testing wether the number is the first in the sequence (zero) and
/// wether it is the last number suported by the platform int representatino.
@freezed
class FibonacciNumber with _$FibonacciNumber {
  /// Constructor
  const factory FibonacciNumber({
    required int value,
    required int previousValue,
  }) = _FibonacciNumber;

  /// Freezed private constructor.
  const FibonacciNumber._();

  /// The initial number in the sequence (0)
  static const zero = FibonacciNumber(value: 0, previousValue: 0);

  /// Returns the next number in the Fibonacci sequence.
  FibonacciNumber get next {
    if (value == 0) {
      return const FibonacciNumber(value: 1, previousValue: 0);
    }
    if (!hasNext) {
      throw StateError('Max value allowed by integer architecture');
    }
    return FibonacciNumber(value: value + previousValue, previousValue: value);
  }

  /// Returns the previous number in the Fibonacci sequence.
  FibonacciNumber get previous {
    if (!hasPrevious) {
      throw StateError('First Fibonacci has no previous');
    }
    return FibonacciNumber(value: previousValue, previousValue: value - previousValue);
  }

  /// Returns if there is a number previous to this.
  bool get hasPrevious => value != 0;

  /// Returns if this is the maximum number supported by the platform int representation.
  bool get hasNext => value + previousValue >= 0;
}

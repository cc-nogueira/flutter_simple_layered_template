/// Business exception to signal the user tryed to go pass the limit of possible Fibonacci values.
class FibonacciLimitException implements Exception {
  /// Constructor.
  const FibonacciLimitException(this.type);

  /// Constant with the lower limit exception.
  static const lowerLimit = FibonacciLimitException(FibonacciLimitType.lower);

  /// Constant with the upper limit exception.
  static const upperLimit = FibonacciLimitException(FibonacciLimitType.upper);

  /// The limit type of the exception.
  final FibonacciLimitType type;
}

/// Enumeration of possible limit types.
enum FibonacciLimitType {
  lower,
  upper;

  bool get isLower => this == FibonacciLimitType.lower;
  bool get isUpper => this == FibonacciLimitType.upper;
}

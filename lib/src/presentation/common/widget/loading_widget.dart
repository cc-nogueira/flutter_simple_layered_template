import 'package:flutter/material.dart';

/// Loading widget.
///
/// Displays a centralized [CircularProgressIndicator].
class LoadingWidget extends StatelessWidget {
  /// Const constructor.
  const LoadingWidget({super.key});

  /// builder helper function for AsyncValue loading callback.
  static Widget Function() get builder => () => const LoadingWidget();

  /// Build a centralized CircularProgressIndicator.
  @override
  Widget build(BuildContext context) => const Center(child: CircularProgressIndicator());
}

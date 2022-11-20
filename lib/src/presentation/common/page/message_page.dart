import 'package:flutter/material.dart';

import '../widget/message_widget.dart';

/// Simple message page.
///
/// Presents a scaffold page with title and a centralized message.
class MessagePage extends StatelessWidget {
  /// Const constructor with title and message.
  const MessagePage({super.key, required this.title, required this.message});

  /// Factory constructor for error message with 'Error' title.
  ///
  /// Accepts an ignored StackTrace argument to make the signature
  /// compatible with AsyncValue error callback.
  factory MessagePage.error(Object error, [StackTrace? _]) =>
      MessagePage(title: 'Error', message: error.toString());

  /// Page title.
  final String title;

  /// Page message.
  final String message;

  /// Build a scaffold with given title and a MessageWidget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: MessageWidget(message),
    );
  }
}

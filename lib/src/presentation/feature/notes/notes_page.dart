import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/notes_use_case.dart';
import '../../common/page/message_page.dart';
import '../../common/widget/loading_widget.dart';
import 'widget/notes_list.dart';

/// Sample page to consume a FutureProvider.
///
/// Renders a LoadingWidget until the future resolves to its async data.
class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWidget = ref.watch(notesProvider).when(
          data: (data) => NotesList(data),
          error: MessagePage.error,
          loading: LoadingWidget.new,
        );
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: asyncWidget,
      floatingActionButton: _floatingActionButton(context, asyncWidget),
    );
  }

  FloatingActionButton? _floatingActionButton(BuildContext context, Widget asyncWidget) {
    return asyncWidget is NotesList
        ? FloatingActionButton(
            onPressed: () => _showToDoMessage(context),
            child: const Icon(Icons.add),
          )
        : null;
  }

  void _showToDoMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: const Text('ToDo!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}

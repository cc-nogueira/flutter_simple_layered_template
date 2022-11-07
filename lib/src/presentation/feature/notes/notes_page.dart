import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/note.dart';
import '../../../domain/provider/providers.dart';
import '../../../domain/usecase/notes_use_case.dart';
import '../../app/routes.dart';
import '../../common/page/loading_page.dart';
import '../../common/page/message_page.dart';

class NotesPage extends ConsumerWidget {
  NotesPage({super.key});

  final _notesProvider = FutureProvider((ref) {
    final NotesUseCase usecase = ref.watch(notesUseCaseProvider);
    return usecase.getNotes();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(_notesProvider).when(
          data: (data) => _NotesPage(data),
          error: ErrorMessagePage.errorBuilder,
          loading: LoadingPage.builder('Notes'),
        );
  }
}

class _NotesPage extends StatelessWidget {
  const _NotesPage(this._notes);

  static const _leadingSize = 24.0;
  final List<Note> _notes;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, idx) => _itemBuilder(context, colors, _notes[idx]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showToDoMessage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, ColorScheme colors, Note note) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.note, arguments: note),
      child: ListTile(
        minLeadingWidth: _leadingSize,
        leading: Icon(
          Icons.note_alt_outlined,
          color: colors.primary,
          size: _leadingSize,
        ),
        title: Text(note.title),
        subtitle: Text(note.text, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
    );
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

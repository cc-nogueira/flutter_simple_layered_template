import 'package:flutter/material.dart';

import '../../../../domain/entity/note.dart';
import '../../../app/routes/routes.dart';

class NotesList extends StatelessWidget {
  const NotesList(this._notes, {super.key});

  static const _leadingSize = 24.0;
  final List<Note> _notes;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, idx) => _itemBuilder(context, colors, _notes[idx]),
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
}

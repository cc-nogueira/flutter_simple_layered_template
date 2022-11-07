import 'package:flutter/material.dart';

import '../../../../domain/entity/note.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleStyle = textTheme.headline6;
    final textStyle = textTheme.bodyLarge;
    return Scaffold(
      appBar: AppBar(title: const Text('Note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: titleStyle, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(child: Text(note.text, style: textStyle)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showToDoMessage(context),
        child: const Icon(Icons.edit),
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

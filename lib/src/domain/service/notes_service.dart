import 'dart:async';

import '../entity/note.dart';

/// NotesService API definition.
///
/// Defines a async API return Future values.
abstract class NotesService {
  /// Get a note by id from service.
  ///
  /// Throws [ArgumentError] if no notes are found with the given id.
  /// Throws [TimeoutException] if the service does not respond.
  Future<Note> getNote(int id);

  /// Get all notes from service.
  ///
  /// Throws [TimeoutException] if the service does not respond.
  Future<List<Note>> getNotes();

  /// Add a note to the service repository.
  ///
  /// Throws [TimeoutException] if the service does not respond.
  Future<void> addNote(Note note);
}

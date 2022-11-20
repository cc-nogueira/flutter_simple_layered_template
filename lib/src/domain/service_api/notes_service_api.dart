import 'dart:async';

import '../entity/note.dart';

/// Notes service API definition.
///
/// Defines a async API return Future values.
abstract class NotesServiceApi {
  /// Get a note by id from service.
  ///
  /// Throws [ArgumentError] if no notes are found with the given id.
  /// Throws [TimeoutException] if the service does not respond.
  Future<Note> getNote(int id);

  /// Get all notes from service.
  ///
  /// Throws [TimeoutException] if the service does not respond.
  Future<List<Note>> getNotes();

  /// Add a note without positive id to the service repository.
  ///
  /// Return the added note with its generated id.
  /// Throws [TimeoutException] if the service does not respond.
  Future<Note> addNote(Note note);

  /// Update a note with positive id in the service repository.
  ///
  /// Throws [ArgumentError] if the note with the given id is not found.
  /// Throws [TimeoutException] if the remote service does not respond.
  Future<void> updateNote(Note note);
}
